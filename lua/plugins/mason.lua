require("mason").setup()
require("mason-lspconfig").setup{
  ensure_installed = { "gopls" }
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").gopls.setup {
  capabilities = capabilities
}
