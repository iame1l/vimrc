syntax on 

let mapleader=" "

set number relativenumber

set so=5

" fcitx5 keep mode
let fcitx5state=system("fcitx5-remote")
if fcitx5state
  autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c 
  " Disable the input method when exiting insert mode and save the state
  autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif 
  " 2 means that the input method was opened in the previous state, and the input method is started when entering the insert mode
endif

" tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" wrap 
set wrap
set textwidth=79
set formatoptions=qrn1

set showmatch
set encoding=utf-8
set nobackup

" search 
set incsearch
set hlsearch
set ignorecase

set ruler
set nocompatible

""""""""" key map""""""""""
nnoremap <leader>w :vsp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap jk <C-c>

nnoremap 0 ^

nnoremap Q :q<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
" Plug 'sheerun/vim-polyglot'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale'

" color scheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
call plug#end()

""""""""""""""""""""""colorscheme"""""""""""""
let g:gruvbox_material_background = 'hard' " 'hard', 'medium', 'soft'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material "gruvbox
" colorscheme onedark
set background=dark
set laststatus=2
" let g:lightline = { ‘colorscheme’: ‘gruvbox’ }

"""""""""""""""""""""statusline"""""""""""""""""
" set showmode
set showcmd
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTree<CR>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""""""""""""""""""""""""""""""""""""""""""""""
let g:highlightedyank_highlight_duration = 500
highlight HighlightedyankRegion cterm=reverse gui=reverse

""""""""""""""""""""easymotion""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nnoremap s <Plug>(easymotion-overwin-f2)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)


"""""""""""""""""""""Tip""""""""""""""""""""""
" :g/^$\n^$/d
"
