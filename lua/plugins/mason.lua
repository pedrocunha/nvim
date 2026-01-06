local lsp = vim.lsp
lsp.config('ts_ls', {
  init_options = {
      preferences = {
          disableSuggestions = true,
      },
  },
})

lsp.config('eslint', {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end
})

require('mason').setup()
require('mason-lspconfig').setup{
  ensure_installed = { 'gopls', 'ts_ls', 'eslint' }
}

vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
