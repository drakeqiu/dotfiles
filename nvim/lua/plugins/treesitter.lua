return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local ts_update = require("nvim-treesitter.install").update({
      with_sync = true
    })
    ts_update()
    require("nvim-treesitter.configs").setup({
      indent = { enable = true, disable = { "python" } },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      ignore_install = { "help" },
      autotag = { enable = true }, -- enable autotagging (w/ nvim-ts-autotag plugin)
      ensure_installed = {
        "cpp",
        "go",
        "rust",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "regex",
        "git_config",
        "jsdoc",
        "make",
        "toml",
        "vimdoc",
        "cmake"
      },
      auto_install = true,
      sync_install = false
    })
  end
}
