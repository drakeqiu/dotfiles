require("nvim-treesitter.configs").setup{
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    'tsx',
    'lua',
    'python',
    'json',
    'graphql',
    'go',
    'gomod',
    'proto',
    'rust'
  },
  sync_install = false,
  autotag = {
    enable = true,
  }
}
