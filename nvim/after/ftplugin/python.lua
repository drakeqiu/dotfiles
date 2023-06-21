local settings = {
  expandtab = true,
  copyindent = true,
  preserveindent = true,
  softtabstop = 0,
  shiftwidth = 4,
  tabstop = 4,
}

return function()
  for key, value in pairs(settings) do
    vim.opt[key] = value
  end
end
