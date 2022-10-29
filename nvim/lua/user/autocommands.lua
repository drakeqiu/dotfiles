local cmd = vim.cmd

cmd [[
  augroup _general_settings
    autocmd!
    autocmd Filetype qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
    autocmd BufWritePre * :%s/\s\+$//e
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup fmt
    autocmd BufWritePre *.css,*.js,*.html Neoformat
  augroup end
]]


--autocmd BufWritePre,TextChanged,InsertLeave *.css,*.js,*.html Neoformat

