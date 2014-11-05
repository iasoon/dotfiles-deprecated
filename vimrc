set nocompatible    " Be Improved!

" Plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Navigation
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'

" Editing
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-unimpaired'
Plugin 'Raimondi/delimitMate'

" Fancy shit
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Language specific
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'dag/vim2hs'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'plasticboy/vim-markdown'

" Bling
Plugin 'bling/vim-airline'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

call vundle#end()            " required
filetype plugin indent on    " required

" }}}

" General settings
syntax on
set lazyredraw
set number
set noswapfile
set autoindent
set scrolloff=8             " keep lines above/below cursor
set tw=80                   " 80 lines wide
set showcmd
let mapleader = "."

" Clipboard
if has ('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
end

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
autocmd FileType coffee setlocal shiftwidth=2 softtabstop=2
autocmd FileType haml setlocal shiftwidth=2 softtabstop=2

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

" Plugin settings

" Always show Airline
let g:airline_powerline_fonts = 1
set laststatus=2

" NERDtree
nmap <Leader>t :NERDTreeToggle<CR>

" NerdCommenter
imap <C-c> <plug>NERDCommenterInsert
nmap ]c o<plug>NERDCommenterInsert
nmap [c O<plug>NERDCommenterInsert

" Unite
let g:unite_winheight=8
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
call unite#custom#profile('default', 'context', {
    \ 'prompt': '» ',
    \ 'direction': 'botright',
    \ 'prompt_direction': 'top',
    \ })

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nmap <Leader>p :Unite -buffer-name=files -start-insert file_rec/async<CR>
nmap <Leader>m :Unite -buffer-name=mru file_mru<CR>
nmap <Leader>y :Unite -buffer-name=yanks history/yank<CR>
nmap <Leader>g :Unite grep:.<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" LatexBox
autocmd filetype tex nmap <Leader>c :Latexmk<CR>

"YouCompleteMe
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"let g:ycm_path_to_python_interpreter = '/usr/bin/python2' UltiSnips
let g:UltiSnipsExpandTrigger="<Leader>s"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" write with sudo
cmap w!! w !sudo tee % > /dev/null

" Colours
set t_Co=256            " 256 colour mode
set background=dark
color Tomorrow-Night-Eighties
hi clear Conceal
hi YcmErrorSection guibg=#3f0000
