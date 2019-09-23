set nocompatible
set number
set hlsearch
set ruler
set noswapfile
set nobackup
set mouse =""

filetype on
filetype indent on
filetype plugin on

set expandtab
set tabstop=2
set shiftwidth=2
set cmdheight=2
set updatetime=500

call plug#begin('~/.vim/plugged')
set rtp+=~/.fzf

filetype plugin indent on

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'matze/vim-move'
Plug 'scrooloose/syntastic'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue'
Plug 'wavded/vim-stylus'
Plug 'easymotion/vim-easymotion'
Plug 'mmalecki/vim-node.js'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

nnoremap <C-p> :Files<CR>

syntax on

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:move_key_modifier = 'C'
let g:ycm_server_python_interpreter="/usr/bin/python2"
map <C-n> :NERDTreeToggle<CR>

autocmd BufNewFile,BufRead *.styl set filetype=stylus
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
let g:vim_vue_plugin_load_full_syntax = 1
