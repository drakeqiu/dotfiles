#!/bin/bash

[[ "$OSTYPE" =~ ^darwin ]] || exit 0

which -s brew > /dev/null
if [[ $? != 0 ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew tap --custom-remote --force-auto-update homebrew/cask https://mirrors.ustc.edu.cn/homebrew-cask.git
fi

DIR="$(cd "$(dirname "${BASE_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"

brew bundle -v --file=${DIR}/homebrew/Brewfile
