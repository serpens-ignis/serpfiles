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
export NEOVIDE_FORK=1
export GHIDRA_INSTALL_DIR=/opt/ghidra/
export GOPATH=$HOME/.go

# devkitPro
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITA64=/opt/devkitpro/devkitA64
export PATH=$PATH:$DEVKITPRO/tools/bin

# work trash
export HAYSTACK_TELEMETRY_ENABLED=False
export NLTK_DATA=~/.nltk_data

###########
# Aliases #
###########

alias vim="neovide"
alias icat="kitten icat"
alias r="ranger"
alias rm="trash"

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
alias lt="eza --icons --group-directories-first -x -T"
