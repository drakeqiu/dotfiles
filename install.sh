#!/bin/bash

declare -r GITHUB_REPOSITORY="drakeqiu/dotfiles"
declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/main"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/src/utils.sh"

function header() {
    echo "$(tput sgr 0 1)$(tput setaf 6)$1$(tput sgr0)"
}

backup() {
    target=$1
    if [ -e "$target" ]; then
        if [ ! -L "$target" ]; then
            mv "$target" "$target.backup"
            echo "-----> Moved your old $target config file to $target.backup"
        fi
    fi
}

symlink() {
    file=$1
    link=$2
    if [ ! -e "$link" ]; then
        echo "-----> Symlinking your new $link"
        ln -s $file $link
    fi
}


download() {

    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then

        curl \
            --location \
            --silent \
            --show-error \
            --output "$output" \
            "$url" \
                &> /dev/null

        return $?

    elif command -v "wget" &> /dev/null; then

        wget \
            --quiet \
            --output-document="$output" \
            "$url" \
                &> /dev/null

        return $?
    fi

    return 1

}

download_utils() {

    local tmpFile=""

    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_UTILS_URL" "$tmpFile" \
        && . "$tmpFile" \
        && rm -rf "$tmpFile" \
        && return 0

   return 1

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
    header "Install xcode-select ..."
    xcode-select -p > /dev/null
    if [[ $? != 0 ]]; then
        xcode-select --install
    fi
    header "Install xcode-select done"
    # brew
    header "Install homebrew ..."
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
    source ./homebrew/brew.sh
    header "Install homebrew done"

    # python
    # if [[ -d $HOME/.pip ]]; then
      # header "create pip folder"
      # mkdir $HOME/.pip
    # fi

    header "Install pip3 ..."
    /usr/local/bin/python3 -m pip install --upgrade pip setuptools wheel cryptography ansible requests virtualenv virtualenvwrapper -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    for name in pip; do
      if [ ! d "$name" ]; then
        target="$HOME/.$name"
        backup $target
        symlink $PWD/$name $target
      fi
    done
    header "Install pip3 done"

    header "Install python modules ..."
    pip3 install -r ./pip/requirements.txt -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    header "Install python modules done"

    # for name in aliases gitconfig zprofile zshrc zimrc; do
      # if [ ! -d "$name" ]; then
        # target="$HOME/.$name"
        # backup $target
        # symlink $PWD/$name $target
      # fi
    # done

    header "Install and update zim ..."
    # curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    zsh ~/.zim/zimfw.zsh install
    header "Install and update zim"

    header "All install done"
    # Ensure that the following actions
    # are made relative to this file's path.

    return

    # cd "$(dirname "${BASH_SOURCE[0]}")" \
        # || exit 1


    # Load utils
    # if [ -x "utils.sh" ]; then
      # . "utils.sh" || exit 1
    # else
        # download_utils || exit 1
    # fi

}

main "$@"
