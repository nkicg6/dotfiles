" defaults
set scrolloff=8
set rnu
set nu
set encoding=utf-8
set noerrorbells
set smartindent expandtab autoindent
set shiftwidth=2 tabstop=2 tabstop=2 softtabstop=2
set backspace=eol,start
set showcmd title
syntax on

" search
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase

" python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" bindings
let mapleader = ' '

" NetRW directory explore
nnoremap <leader>pv :Ex<CR>
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'

" source vimrc
nnoremap <leader><CR> :so $HOME/.vimrc<CR> 

" better Grep
command! -nargs=+ Grep execute 'silent grep! <args>' | copen
command! -nargs=+ RGrep execute 'cgete(system("rg --vimgrep " . <args>))' | copen

" exe
nnoremap <leader>x :silent !chmod +x %<CR>

" quickfix customizations
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>c :copen<CR>
nnoremap <leader>k :ccl<CR>

" plugins
let data_dir = expand($HOME) . "/.vim"
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $HOME/.vimrc
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $HOME/.vimrc
      \| endif

call plug#begin( data_dir . '/plugged') 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
endif
call plug#end()

" color scheme
set background=dark
if (empty($TMUX) && getenv('TERM_PROGRAM') == 'Apple_Terminal')
  colo default
else
  colo tender "gruvbox
endif

if has('termguicolors')
  set termguicolors
endif

" fzf remaps
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
