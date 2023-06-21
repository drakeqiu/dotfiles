local M = {
  {
    -- event = "VeryLazy",
    ft = "go",
    "leoluz/nvim-dap-go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      require("config.dap.go").setup(opts)
    end,
  },
}

return M
