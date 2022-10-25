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
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
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
  -- Plugins here
  use("wbthomason/packer.nvim")

  -- lsp
  use ("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
  use ("williamboman/nvim-lsp-installer")
  use ("jose-elias-alvarez/null-ls.nvim")

  use ("p00f/clangd_extensions.nvim")

  -- cmp plugins
  use ("hrsh7th/nvim-cmp") -- Autocompletion plugin
  use ("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
  use ("hrsh7th/cmp-buffer") -- LSP source for nvim-cmp
  use ("hrsh7th/cmp-path") -- LSP source for nvim-cmp
  use ("hrsh7th/cmp-cmdline") -- LSP source for nvim-cmp
  use ("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
  use ("hrsh7th/cmp-nvim-lsp-signature-help") -- LSP source for nvim-cmp
  use ("hrsh7th/cmp-nvim-lsp-document-symbol") -- LSP source for nvim-cmp

  use ("L3MON4D3/LuaSnip") -- Snippets plugin
  use ("rafamadriz/friendly-snippets")

  use ("nvim-telescope/telescope.nvim")

  use ("nvim-treesitter/nvim-treesitter")
  use ("windwp/nvim-autopairs")
  use ("windwp/nvim-ts-autotag")

  -- git integration
  use ("lewis6991/gitsigns.nvim")

  -- file explorer
  use (
    {"kyazdani42/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  })

  -- symbols outline
  use ("simrat39/symbols-outline.nvim")

  -- buffer line
  use ({
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  })

  -- beatiful statesline
  use ({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = treu}

  })

  -- comment
  use("numToStr/Comment.nvim")

  -- Colorschemes
  use("folke/tokyonight.nvim")
  use("monsonjeremy/onedark.nvim")
  use("lunarvim/darkplus.nvim")
  use("tjdevries/colorbuddy.nvim")
  use("bbenzikry/snazzybuddy.nvim")

  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")

  -- prettier
  use ("sbdchd/neoformat")

  use ("ap/vim-css-color")

  -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
