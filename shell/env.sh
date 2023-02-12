if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
fi

export M2_HOME=/usr/local/maven
export SCALA_HOME=/usr/local/scala
export PATH=$PATH:$M2_HOME/bin:$SCALA_HOME/bin:$HOME/bin

[[ -f $HOME/.env.local.sh ]] && source $HOME/.env.local.sh
