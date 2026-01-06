local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('go').setup({
  lsp_cfg = {
    capabilities = capabilities,
  },
  go_input = require('guihua.input').input,
  lsp_inlay_hints = {
    enable = false, 
  },
  -- go_select = require('guihua.select').select
})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})
