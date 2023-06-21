local indent = 4
vim.opt.shiftwidth = indent
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.textwidth = 120
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true
vim.opt.smartindent = true -- Insert indents automatically

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" } },
      apply = true,
    })
  end,
})
