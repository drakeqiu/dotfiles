source ~/.zplug/init.zsh

zplug "romkatv/powerlevel10k", as:theme, depth:1
# zplug "sbugzu/gruvbox-zsh", as:theme, depth:1
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting"
zplug "wting/autojump"
# zplug "birdhackor/zsh-exa-ls-plugin"
zplug "z-shell/zsh-eza"
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
