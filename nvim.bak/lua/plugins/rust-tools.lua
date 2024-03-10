local M = {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "rust-lang/rust.vim",
      "neovim/nvim-lspconfig",
    },
    -- config = function()
    --   require("rust-tools").setup({})
    -- end,
  },
}

return M
