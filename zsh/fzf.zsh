# Setup fzf
# ---------
FZF_HOME="$HOME/.fzf"

if [[ ! -d $FZF_HOME ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  $FZF_HOME/install
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
