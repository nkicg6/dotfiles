" defaults
set scrolloff=8
set rnu
set encoding=utf-8
set noerrorbells
set tabstop=4 softtabstop=4
set smartindent expandtab autoindent
set backspace=eol,start
set showcmd
syntax on

" search
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase

" python
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" c and go
autocmd FileType c setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal shiftwidth=2 tabstop=2

" bindings
let mapleader = ' '

" NetRW directory explore
nnoremap <leader>pv :Ex<CR>

" source vimrc
nnoremap <leader><CR> :so $HOME/.vimrc<CR> 

" better Grep
command! -nargs=+ Grep execute 'silent vimgrep! <args>' | copen

" quickfix customizations
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $HOME/.vimrc
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $HOME/.vimrc
\| endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform'
call plug#end()

" fzf remaps
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
