if executable("python3")
  com! FormatJSON %!python3 -m json.tool
else
  com! FormatJSON echo "you need to install python3 first!"<CR>
endif
