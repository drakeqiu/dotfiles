vim.api.nvim_create_autocmd("TextYankPost" , {
  callback = function() 
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 300
    }
  end
})

--vim.cmd("colorscheme everforest") 
vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme tokyonight")

-- init.lua
vim.background = dark
