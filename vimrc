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
NeoBundle 'chriskempson/vim-tomorrow-theme'
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
set expandtab       " use spaces for indentation
set tabstop=4       " 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set scrolloff=8     " keep lines above/below cursor
" always draw powerline
set laststatus=2
" leader
let mapleader = "."

" NERDtree
map <Leader>nt :NERDTreeToggle<CR>

" YouCompleteMe
" For use with Eclim
let g:EclimCompletionMethod = 'omnifunc'

" write with sudo
cmap w!! w !sudo tee % > /dev/null

" Enable 256 color mode
set t_Co=256
color trans
