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
set cmdheight=1
set updatetime=500

call plug#begin('~/.vim/plugged')
set rtp+=~/.fzf

filetype plugin indent on

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
Plug 'matze/vim-move'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue'
Plug 'wavded/vim-stylus'
Plug 'easymotion/vim-easymotion'
Plug 'jelera/vim-javascript-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

nnoremap <C-p> :Files<CR>

" Using tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:move_key_modifier = 'C'
syntax on

highlight Pmenu ctermbg=8c9dad guibg=gray

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

autocmd BufNewFile,BufRead *.styl set filetype=stylus
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
let g:vim_vue_plugin_load_full_syntax = 1
