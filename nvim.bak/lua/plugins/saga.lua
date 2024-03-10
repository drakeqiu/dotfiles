local M = {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    local saga = require("lspsaga")
    saga.setup({
      preview = { lines_above = 0, lines_below = 10 },
      scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
      request_timeout = 2000,
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    -- Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
}
return M
