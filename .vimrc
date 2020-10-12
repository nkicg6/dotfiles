" nicks vimrc
" plug
call plug#begin('~/.vim/plugged')
Plug 'jonathanfilip/vim-lucius'
call plug#end()

let g:lucius_style = 'dark'
:colorscheme lucius

set nu
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set autoindent
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set cmdheight=1
set switchbuf=useopen
set colorcolumn=80
set winwidth=80
set shell=bash
set scrolloff=3
set backspace=indent,eol,start
set showcmd
syntax on
filetype plugin indent on
set wildmode=longest,list
set wildmenu
let mapleader=","
:set timeout timeoutlen=1000 ttimeoutlen=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

