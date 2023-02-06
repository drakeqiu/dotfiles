start_proxy()
{
  export http_proxy='127.0.0.1:1087'
  export https_proxy='127.0.0.1:1087'
}

stop_proxy()
{
  unset http_proxy
  unset https_proxy
}

path_remove() {
  PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' |sed 's/:$//')
}

path_append() {
  path_remove "$1"
  PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
  path_remove "$1"
  PATH="$1${PATH:+":$PATH"}"
}
