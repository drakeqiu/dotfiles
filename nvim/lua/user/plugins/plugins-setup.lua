local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer.nvim don't exists")
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- colorschemes
  use 'sainnhe/everforest'
  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'

  -- lspconfig
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- cmp completion and other enhance
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use "onsails/lspkind-nvim"

  -- fuzzy finding w/ telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- some snippet
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- highlight and symbols
  use 'nvim-treesitter/nvim-treesitter'
  use "p00f/nvim-ts-rainbow"
  use {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup{}
    end
  }

  -- git integration
  use 'lewis6991/gitsigns.nvim'

  -- file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- symbols outline
  use 'simrat39/symbols-outline.nvim'

  -- status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use ({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
