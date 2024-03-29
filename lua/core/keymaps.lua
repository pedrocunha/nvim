local keymap = vim.keymap 

-- keymaps for buffers
keymap.set('n', '<tab>', ':bn<CR>', { desc = 'next buffer' })
keymap.set('n', '<s-tab>', ':bp<CR>', { desc = 'previous buffer' })
keymap.set('n', '<leader>d', '<Plug>Kwbd', { desc = '[d]elete buffer' })
keymap.set("n", "<leader>w", ":w<CR>", { desc = '[w]rite buffer' })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = '[n]o [h]ighlight' })
keymap.set("n", "<leader>c", ":ccl<CR>", { desc = '[c]lose quickfix' })
keymap.set("n", "Q", ":quit<CR>", { desc = '[Q]uit buffer' })

keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = '[g]it [b]lame' })

keymap.set("n", "<leader>ga", ":GoAlternate<CR>", { desc = '[g]o [a]lternate' })

local ts = require('telescope.builtin')
keymap.set('n', '<leader>fb', ts.buffers, { desc = '[f]ind [b]uffers'})
keymap.set('n', '<leader>fc', ts.colorscheme, { desc = '[f]ind [c]olorscheme'})
keymap.set('n', '<leader>ff', ts.find_files, { desc = '[f]ind [f]iles'} )
keymap.set('n', '<leader>fg', ts.live_grep, { desc = '[f]ind [g]rep'})
keymap.set('n', '<leader>fh', ts.help_tags, { desc = '[f]ind [h]elp tags'})
keymap.set('n', '<leader>fk', ts.keymaps, { desc = '[f]ind [k]eymap'})
keymap.set('n', '<leader>ft', ts.tags, { desc = '[f]ind [t]ags'})
keymap.set('n', '<leader>fw', ts.grep_string, { desc = '[f]ind [w]ord under cursor'})

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = '[e]xplorer' })
keymap.set('n', '<leader>R', ":TestNearest<CR>", { desc = 'test nearest'})
keymap.set('n', '<leader>r', ":TestFile<CR>", { desc = 'test file'})

keymap.set('n', '<leader>f', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
