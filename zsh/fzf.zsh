# Setup fzf
# ---------
export FZF_HOME="$HOME/.fzf"

if [[ ! "$PATH" == *$FZF_HOME/bin* ]]; then
  path_prepend "$FZF_HOME/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZF_HOME/shell/key-bindings.zsh"
