alias vi="nvim"
alias vim="nvim"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias ra="ranger"
alias sudo="sudo -E"
alias nvi="nvim"
alias vimdiff="nvim -d"
#alias mvim="mvim -v"
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
#alias tnew='tmux -f ~/.tmux.conf new-session \; split-window -h \; split-window -v \;attach'

# eza aliases
eza_params=('--git' '--icons' '--classify' '--group-directories-first' '--time-style=long-iso' '--group' '--color-scale')
alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'
