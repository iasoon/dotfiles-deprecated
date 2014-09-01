set nocompatible    " Be Improved!
filetype plugin indent on

set runtimepath+=~/.vim/bundle/neobundle.vim/

" Let NeoBundle manage NeoBundle
" Required:
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles

" Navigation
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'

" Editing
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'godlygeek/tabular'

" Fancy shit
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'

" Completion
NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build' : {
    \   'unix' : './install.sh'
    \ },
\}
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'

" Javascript
NeoBundleLazy 'jelera/vim-javascript-syntax', {
    \ 'autoload':{
    \   'filetypes': ['javascript']
    \ }
\}

" Looks
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'Lokaltog/vim-distinguished'

NeoBundleCheck

" General settings
syntax on
set lazyredraw
set number
set noswapfile
set autoindent
set scrolloff=8             " keep lines above/below cursor
set clipboard=unnamedplus   " use system clipboard
set showcmd
let mapleader = "."

" Searching
set incsearch
set ignorecase
set smartcase
" redraw screen and clear highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Indenting settings
set expandtab               " use spaces for indentation
set shiftround              " round space shifts to tabs
set tabstop=4               " 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4

" Language specific indenting
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2

" show trailing whitespace as dots
set list
set listchars=tab:\ \ ,trail:·

" Motions

" more convenient than ^ and $
noremap H ^
noremap L g_
" Move line/selection up and down
noremap  <C-j> :m .+1<CR>
noremap  <C-k> :m .-2<CR>
vnoremap <C-j> :m '>+1<CR>gv
vnoremap <C-k> :m '<-2<CR>gv
" Keep selection after indenting
vnoremap > >gv
vnoremap < <gv

" Pasting
imap <C-v> <Esc>pgi

" Plugin settings

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2            " always draw powerline

" NERDtree
map <Leader>t :NERDTreeToggle<CR>

" CtrlP
map <Leader>p :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>

" Commentary
autocmd FileType sed set commentstring=#\ %s
autocmd FileType awk set commentstring=#\ %s

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-w>"
let g:UltiSnipsJumpForwardTrigger="<C-w>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
" let g:UltiSnipsEditSplit="vertical"

" write with sudo
cmap w!! w !sudo tee % > /dev/null

" Mouse scrolling support
" set mouse=nicr
" set ttymouse=xterm

" Colours
set t_Co=256            " 256 colour mode
set colorcolumn=80
color Tomorrow-Night-Eighties
