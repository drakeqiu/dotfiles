local M = {
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      -- telescope
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "find files within current working directory, respects .gitignore",
      },
      {
        "<leader>fs",
        "<cmd>Telescope live_grep<cr>",
        desc = "find string in current working directory as you type",
      },
      {
        "<leader>fc",
        "<cmd>Telescope grep_string<cr>",
        desc = "find string under cursor in current working directory",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "list open buffers in current neovim instance",
      },
      {
        "<leader>lds",
        "<cmd>Telescope lsp_document_symbols<cr>",
        desc = "list all functions/structs/classes/modules in the current buffer",
      },
      -- telescope file browser
      -- {
      --   "<leader>fb",
      --   "<cmd>Telescope file_browser<cr>",
      --   desc = "list all functions/structs/classes/modules in the current buffer",
      -- },
      -- telescope git commands
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Lists available help tags and opens a new window with the relevant help",
      },
      -- telescope git commands
      {
        "<leader>gc",
        "<cmd>Telescope git_commits<cr>",
        desc = 'list all git commits (use <cr> to checkout) ["gc" for git commits]',
      },
      {
        "<leader>gfc",
        "<cmd>Telescope git_bcommits<cr>",
        desc = 'list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]',
      },
      {
        "<leader>gb",
        "<cmd>Telescope git_branches<cr>",
        desc = 'list git branches (use <cr> to checkout) ["gb" for git branch]',
      },
      {
        "<leader>gs",
        "<cmd>Telescope git_status<cr>",
        desc = 'list current changes per file with diff preview ["gs" for git status]',
      },
    },
    config = function()
      local actions = require("telescope.actions")
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            },
          },
        },
      })
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
    end,
  },
}
return M
