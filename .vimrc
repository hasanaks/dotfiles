call plug#begin()

" minimalist colorscheme
Plug 'dikiaap/minimalist'

" darkburn (darker zenburn) colorscheme
Plug 'vim-scripts/darkburn'

" go plugin
Plug 'fatih/vim-go'

call plug#end()

set nocompatible
set noswapfile

filetype plugin on
filetype plugin indent on

set smartindent

set hidden

set tabstop=2
set shiftwidth=0
set expandtab

set ignorecase

set omnifunc=syntaxcomplete#Complete

set path+=**

set wildmenu

nnoremap <Space> <Nop>
let mapleader = ' '

nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

colorscheme darkburn
