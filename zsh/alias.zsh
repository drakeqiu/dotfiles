# zoxide
alias cd=z

# eza
alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'

alias vi="nvim"
alias vim="nvim"
alias nvi="nvim"
alias vimdiff="nvim -d"

#frontend
alias -s html=vi
alias -s rb=vi
alias -s py=vi
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
#rust
alias -s rs=vi
alias -s toml=vi
#go
alias -s go=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

alias sudo="sudo -E"

alias kubectl=kubecolor
#alias k=kubectl
alias k=kubecolor
complete -F __start_kubectl k

