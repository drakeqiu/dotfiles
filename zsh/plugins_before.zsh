
if [ ! -d $HOME/.zplug ]; then
  echo 'zplug is not installed, execute installer'
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
