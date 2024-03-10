local wezterm = require("wezterm")
local act = wezterm.action

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Mocha"
	end
end

local config = {
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	window_background_opacity = 0.9,
	macos_window_background_blur = 70,
	text_background_opacity = 0.9,
	adjust_window_size_when_changing_font_size = false,
	window_close_confirmation = "NeverPrompt",
	warn_about_missing_glyphs = false,
	window_padding = {
		left = 7,
		right = 5,
		top = 10,
		bottom = 5,
	},
	mouse_bindings = {
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = act({ PasteFrom = "Clipboard" }),
		},
	},

	--default_prog = {'zsh'},
	font_size = 14,
	font = wezterm.font_with_fallback({ "FiraCode Nerd Font Mono", "JetBrains Mono" }),
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
}

---keys = {
--  { key = 'z', mods = 'ALT', action = wezterm.action.ShowLauncher },
--},

return config
