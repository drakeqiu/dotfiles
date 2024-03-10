local M = {
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          -- Opt to list sources here, when available in mason.
          -- diagnostic
          "pylint",
          "flake8",
          "vacuum",
          "cpplint",
          "golangci-lint",
          "markdownlint",
          "write-good",
          "tsc",
          "eslint_d",
          "mypy",
          "ruff",
          -- formatter
          "prettier",
          "isort",
          "autopep8",
          "rome",
          "gofumpt",
          "goimports-reviser",
          "golines",
          "stylua",
          "jq",
        },
        automatic_installation = false,
        handlers = {},
      })

      local async_formatting = function(bufnr)
        bufnr = bufnr or vim.api.nvim_get_current_buf()

        vim.lsp.buf_request(
          bufnr,
          "textDocument/formatting",
          vim.lsp.util.make_formatting_params({}),
          function(err, res, ctx)
            if err then
              local err_msg = type(err) == "string" and err or err.message
              -- you can modify the log message / level (or ignore it completely)
              vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
              return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
              return
            end

            if res then
              local client = vim.lsp.get_client_by_id(ctx.client_id)
              vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
              vim.api.nvim_buf_call(bufnr, function()
                vim.cmd("silent noautocmd update")
              end)
            end
          end
        )
      end

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local null_ls = require("null-ls")

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      null_ls.setup({

        sources = {
          -- diagnostics
          diagnostics.pylint.with({
            diagnostics_postprocess = function(diagnostic)
              diagnostic.code = diagnostic.message_id
            end,
          }),
          diagnostics.eslint_d,
          diagnostics.vacuum,
          diagnostics.mypy,
          diagnostics.ruff,
          -- diagnostics.flake8,
          -- null_ls.builtins.diagnostics.markdownlint,
          -- null_ls.builtins.diagnostics.luacheck,
          diagnostics.write_good,
          diagnostics.shellcheck,
          formatting.isort,
          -- null_ls.builtins.formatting.black,
          formatting.prettier,
          formatting.stylua,
          formatting.jq,
          formatting.autopep8,
          formatting.shfmt,
          formatting.rome,
          formatting.gofumpt,
          formatting.goimports_reviser,
          formatting.golines,
        },
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                -- vim.lsp.buf.formatting_sync()
                async_formatting(bufnr)
                -- vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  },
}

return M
