#!/bin/bash

default_server=br-53

servers=`sudo ls /etc/wireguard | sed -n "s/.conf//p"`
interface=`ip route | grep -m 1 default | awk '{print $5}'`

usage() {
    echo -e "Usage: \e[1mvpn [\e[4mCOMMAND\e[24m]"
    echo
	echo -e "\e[1m\e[4mCOMMAND\e[0m:"
    echo -e "    \e[1mon \e[1m[\e[4mSERVER\e[0m\e[1m]\e[0m          Connects to SERVER (default: $default_server)"
    echo -e "    \e[1moff \e[0m                 Disconnects VPN"
    echo -e "    \e[1mrefresh \e[0m             Reconnects to current server"
    echo -e "    \e[1mstatus \e[0m              Print VPN status"
    echo -e "    \e[1mlist \e[0m                List all available VPN servers"
    echo -e "    \e[1mkillswitch [on|off]\e[0m  Enables/Disables killswitch"
    echo -e "    \e[1mnovpn [on|off]\e[0m       Setup/Delete 'novpn' netns"
}

enable_killswitch() {
    # reset rules and block default connections
    sudo ufw reset
    sudo ufw default deny incoming
    sudo ufw default deny outgoing

    # allow connection through VPN tunnels
    for server in $servers
    do
        sudo ufw allow out on ${server%.*}
    done

    # allow LAN connections
    local_ip=`ip -o -f inet addr show $interface | awk '{print $4}'`
    sudo ufw allow in on $interface from $local_ip
    sudo ufw allow out on $interface to $local_ip

    # allow connection to VPN server (for auth)
    for server in $servers
    do
        endpoint=`sudo grep Endpoint /etc/wireguard/$server.conf | sed -n "s/Endpoint = //p"`
        sep=(${endpoint//:/ })
        ip=${sep[0]}
        port=${sep[1]}
        sudo ufw allow out to $ip port $port
    done

    sudo ufw enable
}

disable_killswitch() {
    sudo ufw reset
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw enable
}

killswitch() {
    if [ $1 == on ]; then
        enable_killswitch
    elif [ $1 == off ]; then
        disable_killswitch
    else
        usage
        exit 1
    fi
}

setup_novpn() {
    # create namespace
    sudo ip netns add novpn
    
    # set namespace links
    sudo ip link add novpn link enp5s0 type macvlan mode bridge
    sudo ip link set novpn netns novpn

    # set interfaces up
    sudo ip netns exec novpn ip link set dev lo up
    sudo ip netns exec novpn ip link set dev novpn up

    # set novpn routes
    sudo ip netns exec novpn ip addr add 192.168.15.90/24 dev novpn
    sudo ip netns exec novpn ip route add default via 192.168.15.1 dev novpn

    # test namespace
    sudo ip netns exec novpn sudo fping 1.1.1.1 &>/dev/null && echo "Namespace connects"
    sudo ip netns exec novpn sudo fping 1.1.1.1 &>/dev/null || echo "\033[91mERROR\e[0m: No connection"
    sudo ip netns exec novpn sudo fping google.com &>/dev/null || echo "\033[91mERROR\e[0m: No DNS service"
}

delete_novpn() {
    sudo ip netns pids novpn | sudo xargs -r kill
    sudo ip netns delete novpn
}

novpn() {
    if [ $1 == on ]; then
        setup_novpn
    elif [ $1 == off ]; then
        delete_novpn
    else
        usage
        exit 1
    fi
}

disconnect() {
    connections=`sudo wg | grep interface: | sed -n "s/interface: //p"`
    for connection in $connections
    do
        sudo wg-quick down $connection
    done
}

connect() {
    sudo wg-quick up $1
    if [ $? != 0 ]; then
        return $?
    fi

    connections=`sudo wg | grep interface: | sed -n "s/interface: //p"`
    for connection in $connections
    do
        if [ $connection != $1 ]; then
            sudo wg-quick down $connection
        fi
    done
}

refresh() {
    connections=`sudo wg | grep interface: | sed -n "s/interface: //p"`
    connection=${connections[0]}
    if [[ -z $connection ]]; then
        echo "VPN is not connected"
        return 1
    fi
    disconnect
    connect $connection
}

status() {
    connection=`sudo wg | grep -m 1 interface: | sed -n "s/interface: //p"`
    if [[ -z $connection ]]; then
        echo -e "\e[1m\e[4mVPN\e[0m: \033[91mOFF\e[0m"
    else
        echo -e "\e[1m\e[4mVPN\e[0m: \033[92mON\e[0m ($connection)"
    fi

    ks_status=`sudo ufw status | grep Anywhere`
    if [[ -z $ks_status ]]; then
        echo -e "\e[1m\e[4mKillswitch\e[0m: \033[91mOFF\e[0m"
    else
        echo -e "\e[1m\e[4mKillswitch\e[0m: \033[92mON\e[0m"
    fi

    novpn_status=`sudo ip netns | grep novpn`
    if [[ -z $novpn_status ]]; then
        echo -e "\e[1m\e[4mnovpn namespace\e[0m: \033[91mOFF\e[0m"
    else
        echo -e "\e[1m\e[4mnovpn namespace\e[0m: \033[92mON\e[0m"
    fi

    num_connections=`sudo wg | grep interface: | wc -l`
    if [[ num_connections -gt 1 ]]; then
        echo "\033[91mERROR:\e[0m Multiple connections detected. Try 'vpn refresh'"
    fi
}

list() {
    cfg_files=`sudo ls /etc/wireguard`
    echo -e "\e[1m\e[4mSERVERS\e[0m:"
    for cfg in $cfg_files
    do
        echo "    ${cfg%.*}"
    done
}

case $# in
    1)
        case $1 in
            on) connect $default_server;;
            off) disconnect;;
            refresh) refresh;;
            status) status;;
            list) list;;
            *|-*) usage; exit 1;;
        esac
        ;;
    2)
        case $1 in
            on) connect $2;;
            killswitch) killswitch $2;;
            novpn) novpn $2;;
            *|-*) usage; exit 1;;
        esac
        ;;
    *|-*) usage; exit 1;;
esac
