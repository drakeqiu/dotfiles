# History config
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt AUTO_PUSHD

export CLICOLOR=1
export LSCOLORS=ExGxFxdaCxDaDahbadeche
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# thefuck
#source $HOME/.zsh/thefuck.zsh

# fzf
source $HOME/.zsh/fzf.zsh

# autojump
#source $HOME/.zsh/autojump.zsh
