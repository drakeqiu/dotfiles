if [[ "$OSTYPE" == "darwin"* ]]; then
  type autojump >/dev/null 2>&1
  if [ $? != 0 ]; then
    brew install autojump
  fi
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  type autojump >/dev/null 2>&1
  if [ $? != 0 ]; then
    git clone git://github.com/wting/autojump.git
    cd autojump
    ./install.py
    cd $HOME
    rm -rf $HOME/autojump
  fi
  [[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
  autoload -U compinit && compinit -u
fi
