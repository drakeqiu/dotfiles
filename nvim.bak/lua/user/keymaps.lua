local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local Util = require("user.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  -- @cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- use jk to exit insert mode
map("i", "jk", "<ESC>", { desc = "use jk to exit insert mode" })
-- keymap.set("i", "jk", "<ESC>")

-- clear search highlights
map({ "n" }, "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
map("n", "x", '"_x"', { desc = "Delete single character without copying into register" })

-- window management
map("n", "<leader>sh", "<C-w>s", { desc = "Split window below" })
map("n", "<leader>sv", "<C-w>v", { desc = "Split window right" })
map("n", "<leader>sx", ":close<CR>", { desc = "Close current split window" })
map("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width & height" })
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- tab switch
map("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })

-- buffer switch
map("n", "<leader>bn", ":bnext<CR>", { desc = "Go to next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Go to previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Close current buffer" })

-- search
map({ "i", "n" }, "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Escape and clear hlsearch" })

-- add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<", "v<g")
map("n", ">", "v>g")

-- others
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- neo-tree
-- keymap.set("n", "<leader>e", ":NeoTreeFloatToggle<CR>", opts) -- toggle file explorer
