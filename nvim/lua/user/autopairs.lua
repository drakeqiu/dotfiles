-- Setup nvim-autopairs.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  print("can't find nvim-autopairs")
  return
end

npairs.setup {

}

