# SHELL_FOLDER="$(cd "$(dirname "${BASE_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"
SHELL_FOLDER="$(cd "$(dirname "$0" )" > /dev/null 2>&1 && pwd)"
source $SHELL_FOLDER/functions.sh

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
  header "Install softwares ..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    header "Install softwares for macos..."
    source $SHELL_FOLDER/macos/install.sh
    header "Install softwares for macos done."
  elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    header "Install softwares on linux"
  else 
    header "Failed to detect OSTYPE"
  fi

  
  header "Install python3 packages"
  pip3 install -r $SHELL_FOLDER/requirements.txt -i http://pypi.douban.com/simple --trusted-host pypi.douban.com

}
main "$@"
