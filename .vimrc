
" set runtimepath=~/.vim
syntax on 
set tabstop=4
set so=5

set number relativenumber

" set showmode
set noshowmode
set showcmd
set showmatch

set encoding=utf-8
set wrap
set nobackup

set incsearch
set hlsearch

set ruler

let mapleader=" "

nnoremap <leader>w :vsp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap jk <C-c>

nnoremap 0 ^

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
call plug#end()

colorscheme gruvbox
" colorscheme seoul256
set background=dark
set laststatus=2
" let g:lightline = { ‘colorscheme’: ‘gruvbox’ }

nnoremap <leader>n :NERDTree<CR>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
