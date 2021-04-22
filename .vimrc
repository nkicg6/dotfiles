" nicks vimrc
" plug
call plug#begin('~/.vim/plugged')
Plug 'jonathanfilip/vim-lucius'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
call plug#end()
" call :PlugInstall to install new packages

:colorscheme lucius
LuciusDark 
" LuciusDarkHighContrast his also cool
" Stop allowing arrowkeys for practice
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" end arrowkey stuff
set nu
set encoding=utf-8
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set autoindent
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set hidden
set cmdheight=1
set switchbuf=useopen
set colorcolumn=80
set winwidth=80
set shell=bash
set scrolloff=3
set backspace=indent,eol,start
set showcmd
nnoremap \\ :noh<return>
syntax on 
filetype plugin indent on
set wildmenu
set wildmode=longest,list
:set timeout timeoutlen=1000 ttimeoutlen=100
" hints from how to do 90% of what plugins do with just vim video
" https://www.youtube.com/watch?v=XA2WjJbmmoM
" tab completion fuzzy find
set path+=**
" use :b to autocomplete for open buffer
