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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'

  -- themes supported by 'styler'
  use 'ellisonleao/gruvbox.nvim'
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'EdenEast/nightfox.nvim'

  -- themes NOT supported by 'styler'
  use 'navarasu/onedark.nvim'
  use 'jaredgorski/spacecamp'
  use 'gosukiwi/vim-atom-dark'
  use 'tomasr/molokai'
  use 'NLKNguyen/papercolor-theme'
  use 'cocopon/iceberg.vim'
  use 'nanotech/jellybeans.vim'
  use 'ayu-theme/ayu-vim'
  use 'w0ng/vim-hybrid'
  use 'rafamadriz/neon'
  use({
    "folke/styler.nvim",
    config = function()
        require("styler").setup({
            themes = {
                lua = { colorscheme = "gruvbox" },
                cpp = { colorscheme = "kanagawa" },
                python = { colorscheme = "kanagawa" },
                html = { colorscheme = "gruvbox" },
                xml = { colorscheme = "nightfox" },
                css = { colorscheme = "nightfox" },
                javascript = { colorscheme = "duskfox" },
            },
        })
    end,
  })

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- highlight colour codes
  use 'brenoprata10/nvim-highlight-colors'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
