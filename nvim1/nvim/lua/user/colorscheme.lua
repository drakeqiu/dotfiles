--  vim.cmd [[
--  try
--   colorscheme darkplus
--  catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
--  endtry
--  ]]

--vim.cmd [[
-- try
--  colorscheme onedark
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

require("onedark").setup({
  functionStyle = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

 -- Change the "hint" color to the "orange" color, and make the "error" color bright red
   colors = {hint = "orange", error = "#ff0000"}
})

-- require('colorbuddy').colorscheme('snazzybuddy')
