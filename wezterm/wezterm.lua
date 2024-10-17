-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = wezterm.config_builder()

wezterm.log_info("reloading")

require("keys").setup(config)
-- The color scheme you want to use
local scheme = "BlulocoDark"
-- Obtain the definition of that color scheme
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]

-- For example, changing the color scheme:
config.color_scheme = scheme

-- Font configuration  -- Monaspice NR Nerd Font
config.font_size = 12.5

config.font = wezterm.font_with_fallback({
	{ family = "FiraCode Nerd Font Mono", weight = "Regular" },
	{ family = "MonaspiceNe Nerd Font", weight = "Regular" },
	{ family = "Symbols Nerd Font" },
	{ family = "Hack Nerd Font Mono", weight = "Regular" },
})

-- Window -
config.window_frame = {
	-- inactive_titlebar_bg = "#2b2042",
	-- active_titlebar_bg = "#2b2042",
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 14.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = scheme_def.background,

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_background_opacity = 1.0
config.window_padding = {
	left = 3,
	right = "1cell",
	top = 3,
	bottom = 3,
}

config.initial_cols = 300
config.initial_rows = 120

-- Tab Bar --

config.use_fancy_tab_bar = true
config.colors = {
	tab_bar = {
		background = scheme_def.background,
		-- active_tab = {
		-- 	bg_color = scheme_def.background,
		-- 	fg_color = scheme_def.foreground,
		-- },
		inactive_tab = {
			bg_color = scheme_def.background,
			fg_color = scheme_def.foreground,
		},
	},
	scrollbar_thumb = "#adadad",
}
config.scrollback_lines = 35000
config.enable_scroll_bar = true
-- config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
