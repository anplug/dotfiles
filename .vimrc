set nocompatible
set number
set hlsearch
set ruler
set noswapfile

filetype on
filetype indent on
filetype plugin on

set tabstop=2
set shiftwidth=2
set expandtab

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'matze/vim-move'

Bundle 'mmalecki/vim-node.js'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'digitaltoad/vim-jade'

syntax on

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:move_key_modifier = 'C'
map <C-n> :NERDTreeToggle<CR>

au BufNewFile,BufReadPost *.jade set filetype=jade
