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
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	default_cursor_style = "BlinkingBar",
	font = wezterm.font("Monaspace Neon"),
	font_size = 15.5,
}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"

if not is_darwin() then
	config.default_domain = "WSL:Ubuntu"
end

config.keys = {
	-- paste from the clipboard
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },

	-- paste from the primary selection
	{ key = "v", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config
