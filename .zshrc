#######################
# Setup powerlevel10k #
#######################

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" > /dev/null
fi
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#########################
# Environment variables #
#########################

export ZSH=/usr/share/oh-my-zsh/
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export EDITOR="neovide"
export GHIDRA_INSTALL_DIR=/opt/ghidra/
export PATH=$PATH:/opt/devkitpro/devkitA64/bin

###########
# Aliases #
###########

alias vim="neovide --size 1x1" # random size prevents neovide from starting maximized
alias icat="kitten icat"

###########
# Plugins #
###########

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

###########
# Startup #
###########

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# aliasing ls has to come last
alias ls="eza --icons --group-directories-first -x"
