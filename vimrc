set nocompatible    " Be Improved!

" Plugins {{{
" ==============================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" Navigation {{{
" ------------------------------------------------------------------------------
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'christoomey/vim-tmux-navigator'
" }}}
" Editing {{{
" ------------------------------------------------------------------------------
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-unimpaired'
Plugin 'Raimondi/delimitMate'
" }}}
" Fancy shit {{{
" ------------------------------------------------------------------------------
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" }}}
" Language specific {{{
" ------------------------------------------------------------------------------
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'dag/vim2hs'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'plasticboy/vim-markdown'
Plugin 'mustache/vim-mustache-handlebars'
" }}}
" Bling {{{
" ------------------------------------------------------------------------------
Plugin 'bling/vim-airline'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
" }}}

call vundle#end()            " required
filetype plugin indent on    " required

" }}}

" General settings {{{
" ==============================================================================
let mapleader = ","
syntax on
set autoread                " Reload on change
set scrolloff=8             " keep lines above/below cursor
set lazyredraw              " Faster macros! Yay!
set showcmd                 " Show commands
set noswapfile              " Lol swap files
set tw=80                   " 80 lines wide
set number                  " Show line numbers
set hidden                  " Allow unwritten files to be hidden

" show trailing whitespace as dots
set list
set listchars=tab:\ \ ,trail:·

" Clipboard {{{
" ------------------------------------------------------------------------------
if has ('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
end
" }}}

" Search options {{{
" ------------------------------------------------------------------------------

set incsearch
set ignorecase
set smartcase
" redraw screen and clear highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>
" }}}

" Indenting settings {{{
" ------------------------------------------------------------------------------
set autoindent
set expandtab               " use spaces for indentation
set shiftround              " round space shifts
set tabstop=4               " 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4
" }}}

" Motions {{{
" ------------------------------------------------------------------------------
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
" }}}

" Naviation {{{
" ------------------------------------------------------------------------------
map h :wincmd h<CR>
map t :wincmd j<CR>
map n :wincmd k<CR>
map s :wincmd l<CR>

" }}}

" }}}


" Plugin settings {{{
" ==============================================================================

" Airline {{{
" ------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
set laststatus=2
" }}}

" Delimitmate {{{
" ------------------------------------------------------------------------------
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" }}}

" NERDtree {{{
" ------------------------------------------------------------------------------
nmap <C-t> :NERDTreeToggle<CR>
" }}}

" Unite {{{
"------------------------------------------------------------------------------
let g:unite_winheight=8
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
call unite#custom#profile('default', 'context', {
    \ 'prompt': '» ',
    \ 'direction': 'botright',
    \ 'prompt_direction': 'top',
    \ })
"try
    "" Set up some custom ignores
    "call unite#custom#source('buffer,file,file_rec/async,file_rec,file_mru,file,grep',
    "\ 'ignore_pattern', join([
    "\ '\.tmp/', 
    "\ ], '\|'))
"catch
"endtry

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" g for go
nmap <C-g> :Unite -buffer-name=files -start-insert file_rec/async<CR>
" p for pattern
nmap <C-p> :Unite grep:.<CR>
nmap <C-m> :Unite -buffer-name=mru file_mru<CR>
nmap <C-y> :Unite -buffer-name=yanks history/yank<CR>
nmap <Leader><Leader>  :Unite file<CR>

" }}}

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Le>a <Plug>(EasyAlign)

" LatexBox
autocmd filetype tex nmap <C-c> :Latexmk<CR>

"YouCompleteMe
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1

let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-w"
let g:UltiSnipsJumpBackwardTrigger="<C-S-w>"

" }}}
" }}}

" Language specific settings {{{
" ==============================================================================

"autocmd FileType c setlocal noexpandtab
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType coffee setlocal shiftwidth=2 softtabstop=2
autocmd FileType haml setlocal shiftwidth=2 softtabstop=2

" }}}

" write with sudo
cmap w!! w !sudo tee % > /dev/null

" Colours
set t_Co=256            " 256 colour mode
set background=dark
color Tomorrow-Night-Eighties
hi clear Conceal
hi YcmErrorSection guibg=#3f0000

let g:EclimCompletionMethod = 'omnifunc'
" vim: foldmethod=marker
