local Util = require("lazy.core.util")

local M = {}

M.root_patterns = { ".git", "lua" }

---@param plugin string
function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end
