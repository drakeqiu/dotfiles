local M = {
  {
    event = "VeryLazy",
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    -- keys = {
    --   {
    --     "<leader>db",
    --     "<cmd> DapToggleBreakpoint<CR>",
    --     desc = "Add breakpoint at line",
    --   },
    --   {
    --     "<leader>dus",
    --     function()
    --       local widgets = require("dap.ui.widgets")
    --       local sidebar = widgets.sidebar(widgets.scopes)
    --       sidebar.open()
    --     end,
    --   },
    --   desc = "Open debugging sidebar",
    -- },
    config = function(_)
      require("config.dap").setup()
    end,
  },
}
return M
