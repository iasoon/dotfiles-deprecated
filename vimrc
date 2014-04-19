"Vundle
set nocompatible
filetype off
filetype plugin indent on


set runtimepath+=~/.vim/bundle/neobundle.vim/

" Let NeoBundle manage NeoBundle
" Required:
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
"Bundles
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tomasr/molokai'
NeoBundleCheck

"General

set lazyredraw
syntax on
set number
set noswapfile
"1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set softtabstop=4
"leader
let mapleader = "."

"NERDtree
map <Leader>nt :NERDTreeToggle<CR>

"custom functions
vmap ; :norm 

"Enable 256 color mode
set t_Co=256

color molokai
