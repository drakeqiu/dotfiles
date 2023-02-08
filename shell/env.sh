if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
fi

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.sjtug.sjtu.edu.cn/homebrew-bottles
export M2_HOME=/usr/local/maven
export SCALA_HOME=/usr/local/scala
export PATH=$PATH:$M2_HOME/bin:$SCALA_HOME/bin:$HOME/bin

# go env 
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct

# homebrew mirror
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
