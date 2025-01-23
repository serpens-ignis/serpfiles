#!/bin/bash

status=`sudo ip netns | grep novpn`
if [[ -z $status ]]; then
    vpn novpn on
fi

cmd="export XDG_RUNTIME_DIR=\"/run/user/$UID\"; export \$(dbus-launch); $@"
sudo ip netns exec novpn sudo -u serpens sh -c "$cmd"
