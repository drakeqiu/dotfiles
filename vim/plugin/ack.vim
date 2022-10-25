if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  nnoremap FF :Ack!<Space>
else
  noremap FF :echo "You need to install ACK or AG first"<CR>
endif

