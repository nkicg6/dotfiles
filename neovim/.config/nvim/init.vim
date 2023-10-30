set runtimepath^=$HOME/.vim runtimepath+=$HOME/.vim/after/
let &packpath = &runtimepath
source $HOME/.vimrc

" neovim only plugins

call plug#begin('$HOME/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()

lua require('nmg')
