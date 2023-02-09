#!/bin/bash

[[ "$OSTYPE" =~ ^darwin ]] || exit 0

which -s brew > /dev/null
if [[ $? != 0 ]]; then
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    /bin/bash -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/Homebrew/install@HEAD/install.sh)"
    # brew tap --custom-remote --force-auto-update homebrew/cask https://mirrors.ustc.edu.cn/homebrew-cask.git

    export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"

    # export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

    brew tap --custom-remote --force-auto-update homebrew/core https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
    brew tap --custom-remote --force-auto-update homebrew/cask https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git

    brew tap --custom-remote --force-auto-update homebrew/cask-fonts https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
    brew tap --custom-remote --force-auto-update homebrew/cask-drivers https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git
    brew tap --custom-remote --force-auto-update homebrew/cask-versions https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-versions.git
    brew tap --custom-remote --force-auto-update homebrew/command-not-found https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-command-not-found.git
    brew update
fi

DIR="$(cd "$(dirname "${BASE_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"

export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"

brew bundle -v --file=${DIR}/homebrew/Brewfile
