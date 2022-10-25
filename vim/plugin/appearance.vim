"-------------------
" appearance
"-------------------
set number        " show line number
set noshowmode    " disable mode(because of vim-airline)
set noshowcmd     " disable command
set nolist        " do not display invisible characters
set wrap
set linebreak
set cursorline

set ruler
set showtabline=2
set shortmess=I   " remove splash wording
set equalalways   " split windows are always equal size
"set foldmethod=indent
"set foldmethod=syntax

"-------------------
" Split window
"-------------------
set splitbelow
set splitright

"-------------------
" Scroll
"-------------------
set scrolloff=3

"-------------------
" Tab and space
"-------------------
set softtabstop=2
set shiftwidth=2
set expandtab

"-------------------
" ColorScheme
"-------------------
set t_Co=256
syntax on
try
  set background=dark
  colorscheme onedark
  highlight EndOfBuffer cterm=NONE ctermfg=bg ctermbg=bg
catch
  colorscheme darkblue
endtry

"--------------
" Sound
"--------------
" disable sound on errors
set visualbell
set noerrorbells    "No beeps
set t_vb=
set tm=500
