local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rails'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'

  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  use({'nvim-telescope/telescope-fzf-native.nvim', run='make'}) 
  use({'nvim-telescope/telescope.nvim', branch='0.1.x'}) 

  use 'navarasu/onedark.nvim'
  use 'vim-scripts/kwbdi.vim'
  use 'vim-test/vim-test'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'onsails/lspkind.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

--Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
--
--Plug 'neovim/nvim-lspconfig'
--Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
--Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
--
--Plug 'vim-scripts/closetag.vim'
--Plug 'w0rp/ale'
