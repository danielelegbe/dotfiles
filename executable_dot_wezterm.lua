-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- Check if on macOS
local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

-- This will hold the configuration.
local config = wezterm.config_builder()

config = {
	max_fps = 144,
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = is_darwin() and "RESIZE" or "TITLE | RESIZE",
	default_cursor_style = "BlinkingBar",
	font = wezterm.font("Monaspace Neon"),
	font_size = is_darwin() and 17.5 or 15.5,
	keys = {
		-- Clear all
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = act.ClearScrollback("ScrollbackOnly"),
		},
		-- paste from the clipboard
		{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
		-- paste from the primary selection
		{ key = "v", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
		{
			key = "n",
			mods = "SHIFT|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
	window_padding = {
		left = "1cell",
		right = "1cell",
		top = 0,
		bottom = 0,
	},
	color_scheme = "Catppuccin Mocha",
}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:

if not is_darwin() then
	config.default_domain = "WSL:Ubuntu"
end

-- and finally, return the configuration to wezterm
return config
