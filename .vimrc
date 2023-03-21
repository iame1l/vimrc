
" set runtimepath=~/.vim
syntax on 
set tabstop=4
set textwidth=80
" set formatoptions=tcqmM
set so=5

set number relativenumber

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
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/vim-peekaboo'
Plug 'vim/killersheep'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
call plug#end()

""""""""""""""""""""""colorscheme"""""""""""""
set background=dark
"let g:gruvbox_material_background = 'medium'
"let g:gruvbox_material_better_performance = 1
"colorscheme gruvbox-material
colorscheme gruvbox
" colorscheme seoul256
set laststatus=2
" let g:lightline = { ‘colorscheme’: ‘gruvbox’ }

"""""""""""""""""""""statusline"""""""""""""""""
" set showmode
set showcmd
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
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
nnoremap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""fcitx5""""""""""""""""""""
let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c 
" Disable the input method when exiting insert mode and save the state
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif 
" 2 means that the input method was opened in the previous state, and the input method is started when entering the insert mode

"""""""""""""""""""""Tip""""""""""""""""""""""
" :g/^$\n^$/d
"
