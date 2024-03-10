
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Powerlevel10k
#zinit ice depth=1; zinit light romkatv/powerlevel10k

# zinit pack"default+keys" for fzf

zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions


zinit snippet OMZ::lib/history.zsh
unsetopt share_history

zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

#zinit ice svn
#zinit snippet OMZ::plugins/extract

zinit snippet OMZ::lib/git.zsh

zinit ice lucid wait='1'
zinit snippet OMZ::plugins/git/git.plugin.zsh

# fzf
# zinit pack"default+keys" for fzf

# autojump
zinit snippet OMZ::plugins/autojump


#source ~/.zplug/init.zsh

#zplug "romkatv/powerlevel10k", as:theme, depth:1
# zplug "sbugzu/gruvbox-zsh", as:theme, depth:1
#zplug 'zplug/zplug', hook-build:'zplug --self-manage'
#zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-syntax-highlighting"
#zplug "zsh-users/zsh-history-substring-search"
#zplug "zsh-users/zsh-autosuggestions"
#zplug "zdharma/fast-syntax-highlighting"
#zplug "wting/autojump"
# zplug "birdhackor/zsh-exa-ls-plugin"
# zplug "z-shell/zsh-eza"
#zplug "eza-community/eza"
#zplug "plugins/sudo", from:oh-my-zsh
#zplug "plugins/autojump", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

# Then, source plugins and add commands to $PATH
#zplug load
