set nocompatible    " Be Improved!
filetype off
filetype plugin indent on

set runtimepath+=~/.vim/bundle/neobundle.vim/

" Let NeoBundle manage NeoBundle
" Required:
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build' : {
    \   'unix' : './install.sh'
    \ },
\}
" Language-specific bundles
NeoBundle 'vim-ruby/vim-ruby'

NeoBundleCheck

" General settings
set lazyredraw
syntax on
set number
set noswapfile
set tabstop=4       " 1 tab == 4 spaces
set autoindent
set scrolloff=8     " keep lines above/below cursor
set laststatus=2    " always draw powerline
set showcmd

set expandtab       " use spaces for indentation
set shiftwidth=4
set softtabstop=4

set list            " show whitespace as dots
set listchars=tab:\ \ ,trail:·

" easier motion
noremap H ^
noremap S g_
noremap s l

" leader
let mapleader = "."

" NERDtree
map <Leader>t :NERDTreeToggle<CR>
" CtrlP
map <Leader>p :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" write with sudo
cmap w!! w !sudo tee % > /dev/null

" Enable 256 color mode
set t_Co=256
color molokai
