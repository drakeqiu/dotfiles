return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
    config = true,
    -- config = function()
    -- vim.cmd("colorscheme gruvbox")
    -- vim.cmd([[colorscheme gruvbox]])
    -- end,
    init = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.o.background = "dark"
      vim.opt.termguicolors = true
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      -- vim.cmd([[colorscheme gruvbox-material]])
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
