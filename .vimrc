set nocompatible
set number
set hlsearch
set ruler
set noswapfile
set mouse =""

filetype on
filetype indent on
filetype plugin on

set tabstop=2
set shiftwidth=2
set expandtab

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.fzf

call vundle#rc()

filetype plugin indent on

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'matze/vim-move'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Bundle 'scrooloose/syntastic'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'editorconfig/editorconfig-vim'

Bundle 'mmalecki/vim-node.js'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'rust-lang/rust.vim'
Bundle 'vim-scripts/c.vim'
Bundle 'slim-template/vim-slim.git'

nnoremap <C-p> :Files<CR>

syntax on

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:move_key_modifier = 'C'
map <C-n> :NERDTreeToggle<CR>

au BufNewFile,BufReadPost *.slim set filetype=slim
