set nocompatible
filetype off

set autoread

let mapleader=" "

syntax on

set expandtab
set shiftwidth=4
set autoindent
set smartindent
" set relativenumber
set ignorecase
set number

" Start searching before pressing enter
set incsearch

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

:set clipboard=unnamedplus

" Allow undos and history to be persistant
set undofile
set undolevels=1000
set history=1000

" keep cursor in the middle of the screen when scrolling
set so=10

" Allow using uppercase W and Q commands to save/quit
command WQ wq
command Wq wq
command W w
command Q q
