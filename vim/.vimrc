" defaults
set scrolloff=8
set rnu
set nu
set encoding=utf-8
set noerrorbells
set smartindent expandtab autoindent
set shiftwidth=2 tabstop=2 tabstop=2 softtabstop=2
set backspace=eol,start,indent
set showcmd title
set listchars=trail:·
syntax on

" search
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase

" python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

"md spellcheck
autocmd BufNewFile,BufRead *.md  set ft=markdown
autocmd FileType markdown setlocal spell spelllang=en_us

" bindings
" check for mappings in normal and visual mode with :nmap <C-y> and :vmap <C-y>
let mapleader = ' '
inoremap jk <esc>
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" NetRW directory explore
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'

" source vimrc
nnoremap <leader><CR> :so $HOME/.vimrc<CR> 

" grep and ripgrep
command! -nargs=+ Grep execute 'silent grep! <args>' | copen
command! -nargs=+ RGrep execute 'cgete(system(printf("rg --vimgrep \"%s\"", <args>)))' | copen

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
  silent execute '!curl -fkLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
Plug 'LukeGoodsell/nextflow-vim'
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'ziglang/zig.vim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'mfussenegger/nvim-dap'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/harpoon'
endif
call plug#end()

" color scheme
set background=dark
if $TERM_PROGRAM == 'Apple_Terminal'
  colo default
else
  colo tender "gruvbox
endif

if has('nvim')
  set noacd
endif

if has('termguicolors')
  set termguicolors
endif

" fzf remaps
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>bf :Buffers<CR>
nnoremap <leader>pf :Files<CR>

" overwirte fzf :W
nnoremap <silent> :W<CR> :w<CR>
