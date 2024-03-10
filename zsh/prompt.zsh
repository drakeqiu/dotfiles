#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
#[[ -f $HOME/.p10k-holy.zsh ]] && source $HOME/.p10k-holy.zsh
#[[ -f $HOME/.p10k.zsh ]] && source $HOME/.p10k.zsh
eval "$(starship init zsh)"
