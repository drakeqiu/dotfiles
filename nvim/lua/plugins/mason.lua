local M = {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    event = "VeryLazy",
    config = function()
      require("mason").setup({ ui = { border = "rounded" } })
    end,
    -- config = function()
    --   require("mason").setup()
    -- end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          "emmet_ls",
          "clangd",
          "marksman",
          -- 'pylsp',
          -- 'terraformls',
          "docker_compose_language_service",
          "dockerls",
          "vimls",
          "vtsls",
          -- 'intelephense',
          "gopls",
          "lua_ls",
          "yamlls",
          "bashls",
          "cmake",
          "pyright",
        },
      })
    end,
  },
}
return M
