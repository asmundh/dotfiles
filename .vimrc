" Plugins are configured using Vim8 plugins in the .vim-folder

set nocompatible
filetype off

" Default to not read-only in vimdiff
set noro

filetype plugin indent on

" Plugin configuration
let g:highlightedyank_highlight_duration = -1 " Persist highlighting in vim-highlightedyank

nmap cx <Plug>(ExchangeLine)

set autoread

let mapleader=" "

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=500

syntax on

set expandtab
set shiftwidth=4
set autoindent
set smartindent
" set relativenumber
set ignorecase
set number

" Vim easymotion
nmap <leader>/ <Plug>(easymotion-s2)

" Start searching before pressing enter
set incsearch

" Set j and k to move visual lines (not underlying lines)
nmap j gj
nmap k gk

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

:set clipboard=unnamedplus " Works only if :echo has('clipboard') returns 1

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
