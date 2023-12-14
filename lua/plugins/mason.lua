require('mason').setup()
require('mason-lspconfig').setup{
  ensure_installed = { 'gopls', 'tsserver' }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

lspconfig.gopls.setup {
  capabilities = capabilities
}

lspconfig.tsserver.setup{}

vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
