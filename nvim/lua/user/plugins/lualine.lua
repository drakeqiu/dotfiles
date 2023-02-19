local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
	vim.notify("lualine don't exists")
	return
end

local navic_status, navic = pcall(require, "nvim-navic")
if not navic_status then
	vim.notify("nvim-navic don't exists")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox-material",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		-- lualine_c = { "filename" },
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
		},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = {
			{
				require("noice").api.status.message.get_hl,
				cond = require("noice").api.status.message.has,
			},
			{
				require("noice").api.status.command.get,
				cond = require("noice").api.status.command.has,
				color = { fg = "#ff9e64" },
			},
			{
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = { fg = "#ff9e64" },
			},
			{
				require("noice").api.status.search.get,
				cond = require("noice").api.status.search.has,
				color = { fg = "#ff9e64" },
			},
		},

		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
