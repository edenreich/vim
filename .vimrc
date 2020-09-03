set nocompatible              
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'sheerun/vim-polyglot'

call vundle#end()

syntax on
filetype plugin indent on

set path+=**
set wildmenu
set laststatus=2
set modifiable
set number

map <C-n> :NERDTreeToggle<CR>
