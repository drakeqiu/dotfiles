local M = {}
function M.setup(opts)
  local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  require("dap-python").setup(path, opts)
  -- code
end

return M
