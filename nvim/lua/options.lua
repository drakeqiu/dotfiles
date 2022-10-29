-- file settings
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.writebackup = false
vim.opt.autoread = true
vim.bo.autoread = true

-- file encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = "c"
vim.opt.clipboard:append ("unnamedplus")

-- tab and space
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.expandtab = true

-- split window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- appearance
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.linebreak = true
vim.opt.numberwidth = 4
vim.wo.signcolumn = "no"
vim.opt.wrap = false
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.showtabline = 2
vim.opt.equalalways = true
vim.opt.syntax = "on"
vim.opt.cmdheight = 2
vim.opt.conceallevel = 0
vim.opt.pumheight = 10

vim.opt.updatetime = 100

-- sound
-- disable error sound
vim.opt.errorbells = false

vim.opt.shortmess:append "c"
vim.opt.shortmess:append "I"
vim.opt.iskeyword:append "-"
vim.opt.formatoptions:remove "cro"

vim.api.nvim_command("set whichwrap+=<,>,[,],h,l")
vim.api.nvim_command("filetype off")
vim.api.nvim_command("filetype indent plugin on")
