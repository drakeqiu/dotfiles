-- :help options

local options = {
  -- settings
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  mouse = "a",
  pumheight = 10,
  fileencoding = "utf-8",

  backup = false,
  swapfile = false,
  undofile = false,
  writebackup = false,

  -- timeoutlen = 100,
  -- updatetime = 300,

  -- split windonw
  splitbelow = true,     -- Horizontal windows should be split to bottom
  splitright = true,     -- Vertical windows should be split to right

  -- appearance,
  number = true,
  relativenumber = false,
  showmode = false,
  showcmd = false,
  linebreak = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = true,
  ruler = true,
  cursorline = true,
  showtabline = 2,
  equalalways = true,

  -- scrolloff
  scrolloff = 3,
  sidescrolloff = 3,

  -- tab and space
  softtabstop = 2,
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  smartindent = true,

  -- search
  hlsearch = true,
  ignorecase = true,
  incsearch = true,
  smartcase = true,

  -- color scheme
  syntax = "on",

  -- sound
  -- disable sound in errors
  -- visualbell = true,
  errorbells = false,
  termguicolors = true,
  autoread = true,
}

vim.opt.shortmess:append "c"
vim.opt.shortmess:append "I"
vim.opt.iskeyword:append "-"
vim.opt.formatoptions:remove "cro"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "filetype off"
vim.cmd "filetype indent plugin on"
-- vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work


