local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require ("user.lsp.configs")
require ("user.lsp.handlers").setup()

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
