local default_opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Normal --
-- Disable arrow keys
keymap("n", "<Up>", "<Nop>", default_opts)
keymap("n", "<Down>", "<Nop>", default_opts)
keymap("n", "<Left>", "<Nop>", default_opts)
keymap("n", "<Right>", "<Nop>", default_opts)

keymap("i", "<Up>", "<Nop>", default_opts)
keymap("i", "<Down>", "<Nop>", default_opts)
keymap("i", "<Left>", "<Nop>", default_opts)
keymap("i", "<Right>", "<Nop>", default_opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

-- Split window
--keymap("n", "ss", ":split<CR><C-w>w", {noremap = false, silent = true})
--keymap("n", "sv", ":vsplit<CR><C-w>w", {noremap = false, silent = true})

-- Visual
-- Stay in indent mode
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

keymap("v", "p", '"_dP', default_opts)


-- sudo to write
keymap("c", ":w!!", "!sudo tee % > /dev/null", default_opts)

keymap("i", "<leader>W", "<Esc>:w<CR>", default_opts)
keymap("n", "<leader>w", ":w<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Resizing panes
keymap("n", "<S-h>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<S-l>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<S-j>", ":resize -1<CR>", default_opts)
keymap("n", "<S-k>", ":resize +1<CR>", default_opts)
