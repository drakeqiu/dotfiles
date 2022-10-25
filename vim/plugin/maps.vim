"-------------------
" key mappings
"-------------------
" disable arroy keys
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>

" leader + w save
inoremap <leader>W <Esc>:w<CR>
nnoremap <leader>w :w<CR>

" previous and next buffer
noremap <silent> [b :bp<CR>
noremap <silent> ]b :bn<CR>

" use ctrl+h/j/k/l switch window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" sudo to write
cnoremap w!! w !sudo tee % > /dev/null

" Split window
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :retab

