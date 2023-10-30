local lspconfig = require("lspconfig")

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- golang
lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) 
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) 
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) 
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) 
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0}) 
    vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, {buf=0})
  end, 
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

vim.opt.completeopt={"menu", "menuone", "noselect"}
-- completion nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

