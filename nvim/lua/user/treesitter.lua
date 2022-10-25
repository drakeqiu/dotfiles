local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = {"cpp", "c", "lua", "rust", "python", "go","java", "javascript", "html", "css", "scss", "scala", "bash","comment", "erlang", "cmake","make", "dockerfile", "json", "sql", "markdown"}, -- one of "all" or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    -- disable = { "css" }, -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
    -- disable = { "python", "css" },
  },
})
