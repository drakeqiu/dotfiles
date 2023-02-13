# dev env
# java
export M2_HOME=/usr/local/maven
export PATH=$PATH:$M2_HOME/bin
# scala
export SCALA_HOME=/usr/local/scala
export PATH=$PATH:$SCALA_HOME/bin
# go env
export GO_HOME=/usr/local/go
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
export PATH=$PATH:$GO_HOME/bin

export PATH="/usr/local/opt/llvm/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# HOMEBREW mirror config
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
