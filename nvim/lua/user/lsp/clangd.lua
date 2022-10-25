

require("lspconfig")["clangd"].setup({
  cmd = { "clangd", "--background-index"},
  filetypes = { "c", "cpp", "hpp", "objc", "objcpp" },
})


