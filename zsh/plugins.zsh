# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# syntax highlighting
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# auto completion
# zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

# auto sugestion
# zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# eza
zinit ice from'gh-r' as'program' sbin'**/eza -> eza' atclone'cp -vf completions/eza.zsh _eza'
zinit light eza-community/eza

zinit wait lucid for \
  has'eza' atinit'AUTOCD=1' \
    z-shell/zsh-eza

# fzf-tab
zinit light Aloxaf/fzf-tab

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# OMZ framework
zinit snippet OMZP::sudo
zinit snippet OMZP::git
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found
zinit snippet OMZP::golang
zinit snippet OMZP::rust

zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

