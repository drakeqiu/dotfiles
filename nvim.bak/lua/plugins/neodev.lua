local M = {
  {
    event = "VeryLazy",
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({})
    end,
  },
}
return M
