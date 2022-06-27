call plug#begin()

" minimalist colorscheme
Plug 'dikiaap/minimalist'

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

set path+=**
set path+=/usr/local/include/

set wildmenu

set encoding=utf-8

colorscheme minimalist

set number
set signcolumn=number

set omnifunc=syntax#SyntaxComplete

nnoremap <Space> <Nop>
let mapleader = ' '

nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

inoremap <C-e> <C-o>A

tnoremap <Esc> <C-\><C-n>

command MakeTags !ctags -R .

highlight LineNr ctermfg=grey ctermbg=1842204
