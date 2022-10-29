local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if status_ok then
  lsp_installer.on_server_ready(function(server)
    local opts = {}

    server:setup(opts)
  end)
  lsp_installer.settings({
    ui =  {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  })
end
