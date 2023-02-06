vim.g.mapleader = ","
vim.g.maplocalleader = ","

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>q", "<Cmd>q<CR>")
keymap.set("n", "<leader>w", "<Cmd>w<CR>")

keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "s", "<noop>", opts)
keymap.set("n", "<leader>ss", ":split<CR><C-w>w", opts)
keymap.set("n", "<leader>sv", ":vsplit<CR><C-w>w", opts)
keymap.set("n", "<leader>sc", "<C-w>c", {silent = true})
keymap.set("n", "<leader>so", "<C-w>o", {silent = true})
keymap.set("n", "<leader>sf", "<C-w>w")
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

keymap.set("n", "<leader>s<left>", "<C-w><")
keymap.set("n", "<leader>s<right>", "<C-w>>")
keymap.set("n", "<leader>s<up>", "<C-w>+")
keymap.set("n", "<leader>s<down>", "<C-w>-")
