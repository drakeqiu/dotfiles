# Setup fzf
# ---------
FZF_HOME="$HOME/.fzf"

if [[ ! -d $FZF_HOME ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  $FZF_HOME/install --bin
fi

if [[ ! -f $FZF_HOME/bin/fzf ]]; then
  $FZF_HOME/install --bin
fi

if [[ ! "$PATH" == *$FZF_HOME/bin* ]]; then
  path_prepend "$FZF_HOME/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZF_HOME/shell/key-bindings.zsh"
