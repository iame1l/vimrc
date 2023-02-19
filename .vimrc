
" set runtimepath=~/.vim
syntax on 
set tabstop=4
set textwidth=80
" set formatoptions=tcqmM
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
set ignorecase

set ruler


let mapleader=" "

nnoremap <leader>w :vsp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap jk <C-c>

nnoremap 0 ^

set nocompatible
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/vim-peekaboo'
Plug 'vim/killersheep'
Plug 'sheerun/vim-polyglot'
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

""""""""""""""""""""fcitx5""""""""""""""""""""
let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c 
" Disable the input method when exiting insert mode and save the state
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif 
" 2 means that the input method was opened in the previous state, and the input method is started when entering the insert mode

"""""""""""""""""""""Tip""""""""""""""""""""""
" :g/^$\n^$/d
"
