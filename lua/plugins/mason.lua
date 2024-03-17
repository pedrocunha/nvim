require('mason').setup()
require('mason-lspconfig').setup{
  ensure_installed = { 'gopls', 'tsserver' }
}

require('go').setup()

local lspconfig = require 'lspconfig'
lspconfig.gopls.setup({
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

lspconfig.tsserver.setup{}

vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
