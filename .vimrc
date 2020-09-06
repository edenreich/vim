set nocompatible              
filetype off 

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'

call plug#end()

syntax on
filetype plugin indent on

set path+=**
set wildmenu
set laststatus=2
set modifiable
set number
set ts=3 sw=4

map <C-n> :NERDTreeToggle<CR>
