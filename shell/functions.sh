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
