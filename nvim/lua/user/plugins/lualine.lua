-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine theme
local theme = require("lualine.themes.gruvbox")


-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = theme,
  },
})
