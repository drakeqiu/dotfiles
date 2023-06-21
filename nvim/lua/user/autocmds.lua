local cmd = vim.cmd

-- This file is automatically loaded by init.lua

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Hightlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd = ")
  end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query", -- :inspectTree
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "vim",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- Wrap in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

-- Don't auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", { pattern = "", command = "set fo-=c fo-=r fo-=o" })

-- cmd [[
--   augroup _general_settings
--     autocmd!
--     autocmd Filetype qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
--     autocmd BufWinEnter * :set formatoptions-=cro
--     autocmd WinEnter * setlocal cursorline
--     autocmd WinLeave * setlocal nocursorline
--     autocmd BufWritePre * :%s/\s\+$//e
--   augroup end
--
--   augroup _git
--     autocmd!
--     autocmd FileType gitcommit setlocal wrap
--     autocmd FileType gitcommit setlocal spell
--   augroup end
--
--   augroup _markdown
--     autocmd!
--     autocmd FileType markdown setlocal wrap
--     autocmd FileType markdown setlocal spell
--   augroup end
--
--   augroup fmt
--     autocmd BufWritePre *.css,*.js,*.html Neoformat
--   augroup end
-- ]]
--
--
-- --autocmd BufWritePre,TextChanged,InsertLeave *.css,*.js,*.html Neoformat
--
