syntax on 

let mapleader=" "

set number relativenumber
set autochdir
set autoindent
set spell
set spelllang=en

set wildchar=<Tab> wildmenu wildmode=full

set so=5

""""""""""flod set""""""""" {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" fcitx5 keep mode {{{
let fcitx5state=system("fcitx5-remote")
if fcitx5state
    autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c 
    " Disable the input method when exiting insert mode and save the state
    autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif 
    " 2 means that the input method was opened in the previous state, and the input method is started when entering the insert mode
endif
" }}}

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
set timeoutlen=350

""""""""" buffers """""""""" {{{
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap bn :buffers<CR>:buffer<Space>
" }}}

""""""""" key map"""""""""" {{{
nnoremap <leader>w :vsp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap jk <C-c>

nnoremap 0 ^
nnoremap U <C-R>

nnoremap Q :q<CR>

nnoremap == gg=G<C-o><C-o>
" }}}

""""""""" plug in"""""""""" {{{
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
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'vimwiki/vimwiki'

" statusline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" auto-complete
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'rust-lang/rust.vim'

" fuzzy finder
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" color scheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
""""""""""""""""""""""colorscheme"""""""""""""
let g:gruvbox_material_background = 'hard' " 'hard', 'medium', 'soft'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material "gruvbox

" colorscheme onedark
set background=dark
set laststatus=2
" let g:lightline = { ‘colorscheme’: ‘gruvbox’ }
" }}}

"""""""""""""""""""""statusline""""""""""""""""" {{{
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
" }}}

"""""""""""""""""""""explore"""""""""""""""""""" {{{
nnoremap <leader>n :NERDTree<CR>
" }}}

""""""""""""""""""""cursor"""""""""""""""""""" {{{
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" }}}

""""""""""""""""""""highlightyank""""""""""""" {{{
let g:highlightedyank_highlight_duration = 500
highlight HighlightedyankRegion cterm=reverse gui=reverse
" }}}

""""""""""""""""""""easymotion"""""""""""""""" {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nnoremap <Leader>s <Plug>(easymotion-overwin-f2)
" or
" `s{char}{char}{label}`
" nnoremap <Leader>f <Plug>(easymotion-overwin-f2)
nnoremap <Leader>f <Plug>(easymotion-overwin-f)

" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)
" }}}

""""""""""""""""""""auto-complete""""""""""""" {{{
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" }}}

""""""""""""""""""""LSP""""""""""""""""""""""" {{{
" vim-lsp
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" }}}

""""""""""""""""""""fuzzy finder""""""""""""""""" {{{
" leaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup=1
nnoremap <c-n> :LeaderfMru<cr>
" let g:Lf_ShortcutF = '<leader><leader>F'
" let g:Lf_ShortcutF = '<C-P>'
nnoremap gf :Leaderf file<CR>
" nnoremap <leader>f :Leaderf file<CR>
nnoremap <leader>t :Leaderf gtags<CR>
nnoremap <leader>rg :Leaderf rg<CR>
let g:Lf_ShortcutB = '<m-n>'
let g:Lf_Gtagslabel = 'native-pygments'

" fzf
" }}}

"""""""""""""""""""""Tip""""""""""""""""""""""
" :g/^$\n^$/d
"
