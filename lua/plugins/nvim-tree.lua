-- Disable netrw (Neovim's default file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup nvim-tree with modern configuration
require("nvim-tree").setup({
  -- Ensure tree doesn't auto-open by not adding any autocommands
  -- The tree will only open when explicitly called via :NvimTreeToggle or keymaps
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
