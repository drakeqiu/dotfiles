local M = {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  -- event = "VeryLazy",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function(_, opts)
    require("config.dap.python").setup(opts)
  end,
}
return M
