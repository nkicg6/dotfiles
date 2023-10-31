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

-- directly from https://cs.opensource.google/go/x/tools/+/refs/tags/gopls/v0.14.1:gopls/doc/vim.md
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
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
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
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

