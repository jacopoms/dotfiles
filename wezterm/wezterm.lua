-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.log_info("reloading")

-- Configuration options
local scheme = os.getenv("WEZTERM_COLOR_SCHEME") or "BlulocoDark"
local font_size = tonumber(os.getenv("WEZTERM_FONT_SIZE")) or 12.5

-- Obtain the definition of the selected color scheme
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]

config = {
	-- General settings
	color_scheme = scheme,
	font_size = font_size,
	font = wezterm.font_with_fallback({
		{ family = "FiraCode Nerd Font Mono", weight = "Regular" },
		{ family = "Hack Nerd Font Mono", weight = "Regular" },
		{ family = "Cascadia Code", weight = "Regular" },
		{ family = "MonaspiceNe Nerd Font", weight = "Regular" },
		{ family = "Symbols Nerd Font" },
	}),
	automatically_reload_config = true,

	-- Window configuration
	window_frame = {
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),
		font_size = 14.0,
		active_titlebar_bg = scheme_def.background,
		inactive_titlebar_bg = "#333333",
	},
	window_decorations = "RESIZE",
	window_background_opacity = 1.0,
	window_padding = {
		left = 3,
		right = "1cell",
		top = 3,
		bottom = 3,
	},
	initial_cols = 300,
	initial_rows = 120,

	-- Tab bar configuration
	use_fancy_tab_bar = true,
	colors = {
		tab_bar = {
			background = scheme_def.background,
			inactive_tab = {
				bg_color = scheme_def.background,
				fg_color = scheme_def.foreground,
			},
		},
		scrollbar_thumb = "#adadad",
	},
	scrollback_lines = 35000,
	enable_scroll_bar = true,
}

require("keys").setup(config)
-- Return the configuration to wezterm
return config
