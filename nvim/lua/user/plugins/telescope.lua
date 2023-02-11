-- import telescope plugin safely
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- import telescope actions safely
local status_ok, actions = pcall(require, "telescope.actions")
if not status_ok then
  return
end

-- configure telescope
telescope.setup({})

telescope.load_extension("fzf")
