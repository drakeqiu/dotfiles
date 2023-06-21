local M = {
  {
    event = "VeryLazy",
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
      -- "hrsh7th/nvim-cmp",
      -- "SmiteshP/nvim-navic",
      "jose-elias-alvarez/typescript.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      local navic = require("nvim-navic")
      local typescript = require("typescript")

      local keymap = vim.keymap -- for conciseness

      -- enable keybinds only for when lsp server available
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true, noremap = true }
          -- set keybinds
          keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
          keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
          -- keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
          keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
          keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
          keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
          keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
          keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
          keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
          keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
          keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
          keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
          keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
          keymap.set("n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", opts) -- see outline on right hand side
        end,
      })
      local on_attach = function(client, bufnr)
        -- client.offsetEncoding = "utf-8"
        -- nvim-navic settings
        navic.attach(client, bufnr)

        -- keybind options
        local opts = { noremap = true, silent = true, buffer = bufnr }
        -- typescript specific keymaps (e.g. rename file and update imports)
        if client.name == "tsserver" then
          keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts) -- rename file and update imports
          keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", opts) -- organize imports (not in youtube nvim video)
          keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", opts) -- remove unused variables (not in youtube nvim video)
        end
      end

      -- configure pyright server
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "python" },
        settings = {
          pyright = {
            autoImportCompletion = true,
            python = {
              analysis = { autoSearchPaths = true, useLibraryCodeForTypes = true },
            },
          },
        },
      })

      -- configure gopls server
      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        -- cmd = { "gopls", "serve" },
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        single_file_support = true,
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            -- experimentalPostfixCompletions = true,
            analyses = { unusedparams = true, shadow = true },
            -- staticcheck = true,
          },
        },
        init_options = { usePlaceholders = true },
      })

      -- configure lua_ls server
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
                -- vim.api.nvim_get_runtime_file("", true),
                -- "/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/",
                -- vim.fn.expand("~/lualib/share/lua/5.4"),
                -- vim.fn.expand("~/lualib/lib/luarocks/rocks-5.4"),
                -- "/opt/homebrew/opt/openresty/lualib",
              },
            },
            completion = { callSnippet = "Replace" },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
          },
        },
      })

      -- markdown
      lspconfig.marksman.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- bashls
      lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- typescript
      typescript.setup({
        server = { capabilities = capabilities, on_attach = on_attach },
      })

      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },
}
return M
