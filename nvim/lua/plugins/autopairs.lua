local M = {
  {
    event = "VeryLazy",
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter" },
  },
  {
    event = "VeryLazy",
    "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { "string" }, -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
          java = false, -- don't check treesitter on java
        },
      })
    end,
  },
}
return M
