set nocompatible    " Be Improved!
filetype off
filetype plugin indent on

set runtimepath+=~/.vim/bundle/neobundle.vim/

" Let NeoBundle manage NeoBundle
" Required:
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build' : {
    \   'unix' : './install.sh'
    \ },
\}

NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'Lokaltog/vim-distinguished'

" Language-specific bundles
NeoBundle 'vim-ruby/vim-ruby'

NeoBundleCheck

" General settings
syntax on
set lazyredraw
set number
set noswapfile
set tabstop=4               " 1 tab == 4 spaces
set autoindent
set scrolloff=8             " keep lines above/below cursor
set clipboard=unnamedplus   " use system clipboard
set showcmd
" Searching
set incsearch
set ignorecase
set smartcase

set expandtab               " use spaces for indentation
set shiftround              " round space shifts to tabs
set shiftwidth=4
set softtabstop=4

set list                    " show trailing whitespace as dots
set listchars=tab:\ \ ,trail:·

" leader
let mapleader = "."

" motion
noremap H ^
noremap L g_

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

" EasyMotion
map <Leader> <Plug>(easymotion-prefix)

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" write with sudo
cmap w!! w !sudo tee % > /dev/null

" Enable 256 color mode
set t_Co=256
color Tomorrow-Night-Eighties
