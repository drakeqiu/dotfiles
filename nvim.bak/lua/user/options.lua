vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.tex_flavor = "latex"

local opt = vim.opt
local bo = vim.bo
local wo = vim.wo
local indent = 2

opt.backup = false
opt.autowrite = true
opt.swapfile = false
opt.undofile = false
opt.writebackup = false
opt.autoread = true
bo.autoread = true

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.autoindent = true
opt.inccommand = "nosplit" -- Preview incremental substitute
opt.laststatus = 0
opt.list = true            -- Show some invisible characters(tabs...)
opt.number = true          -- Print line number
opt.pumblend = 10          -- Popup blend
opt.pumheight = 10         -- Maximum number of entires in a popup
opt.relativenumber = true  -- Relative line numbers
opt.scrolloff = 4          -- Lines of context
opt.shiftround = true      -- Round indent
opt.showmode = false       -- Dont show mode since we have a status line
opt.sidescrolloff = 8      -- Columns of context
opt.showcmd = false
opt.linebreak = true
opt.numberwidth = 4
wo.signcolumn = "no"
opt.wrap = false      -- Disable line wrap
opt.ruler = true
opt.cursorline = true -- Enable highlighting of the current line
opt.showtabline = 2
opt.equalalways = true
opt.syntax = "on"
opt.cmdheight = 2
opt.conceallevel = 0
opt.pumheight = 10

opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.timeoutlen = 500 -- Set wait time

opt.softtabstop = indent
opt.tabstop = indent
opt.shiftwidth = indent             -- Size of an indent
opt.expandtab = true                -- Use spaces instead of tabs
opt.autoindent = true
opt.smartindent = true              -- Insert indents automatically

opt.mouse = "c"                     -- Disable mouse mode
opt.clipboard:append("unnamedplus") -- Sync with system clipboard
opt.backspace = "indent,eol,start"  -- backspace

opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true     -- Don't ignore case with capitalse

opt.termguicolors = true -- True color support
opt.signcolumn = "yes"

-- opt.spell = true -- Enable spell check
-- opt.spelllang = {"en"}
-- opt.spelloptions = "camel" -- enable camel case

opt.errorbells = false

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 20

opt.shortmess:append({ W = true, I = true, c = true })

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end
opt.iskeyword:append("-")
opt.formatoptions:remove("cro")

opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width

vim.api.nvim_command("set whichwrap+=<,>,[,],h,l")
vim.api.nvim_command("filetype off")
vim.api.nvim_command("filetype indent plugin on")

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
