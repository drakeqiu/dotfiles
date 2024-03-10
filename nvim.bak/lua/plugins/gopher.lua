local M = {
  "olexsmir/gopher.nvim",
  ft = "go",
  -- event = "VeryLazy",
  config = function(_, opts)
    require("gopher").setup(opts)
  end,
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
  keys = {
    { "<leader>gsj", "<cmd> GoTagAdd json <CR>", desc = "Add json struct tags", },
    { "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", desc = "Add yaml struct tags", },
  },
}
return M
