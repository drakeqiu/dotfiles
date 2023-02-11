local opt = vim.opt
local bo = vim.bo
local wo = vim.wo

opt.backup = false
opt.swapfile = false
opt.undofile = false
opt.writebackup = false
opt.autoread = true
bo.autoread = true

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.showmode = false
opt.showcmd = false
opt.linebreak = true
opt.numberwidth = 4
wo.signcolumn = "no"
opt.wrap = false
opt.ruler = true
opt.cursorline = true
opt.showtabline = 2
opt.equalalways = true
opt.syntax = "on"
opt.cmdheight = 2
opt.conceallevel = 0
opt.pumheight = 10

opt.updatetime = 100

opt.softtabstop = 2
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.mouse = "c"
opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true


opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"

opt.errorbells = false

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.shortmess:append "c"
opt.shortmess:append "I"
opt.iskeyword:append "-"
opt.formatoptions:remove "cro"

vim.api.nvim_command("set whichwrap+=<,>,[,],h,l")
vim.api.nvim_command("filetype off")
vim.api.nvim_command("filetype indent plugin on")
