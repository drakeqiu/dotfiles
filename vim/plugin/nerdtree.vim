" Map F2 to toggle NERDTree
" nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>v :NERDTreeFind<CR>
nnoremap <silent> <leader>g :NERDTreeToggle<CR>

" Looks better :)
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25

" Reset root directory when switch dir in NERDTree
let NERDTreeChDirMode = 2

" Delete buffer if file is deleted
let NERDTreeAutoDeleteBuffer = 1

" Display empty subfolder correctly
let NERDTreeCascadeSingleChildDir = 0

" Remove NERDTree window if there's no any buffer exists
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" instruction
" m: add or change node(a/m)
" I: toggle hidden I
" u: go to up folder
" C: go to folder
