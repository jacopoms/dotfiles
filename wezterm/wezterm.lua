-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.log_info("reloading")

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end

local appearance = wezterm.gui.get_appearance()

-- Configuration options
local scheme = os.getenv("WEZTERM_COLOR_SCHEME") or scheme_for_appearance(appearance)
local font_size = tonumber(os.getenv("WEZTERM_FONT_SIZE")) or 12.5

-- Obtain the definition of the selected color scheme
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]

config = {
	-- General settings
	color_scheme = scheme,
	font_size = font_size,
	font = wezterm.font_with_fallback({
		{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
		{ family = "JetBrains Mono", weight = "Regular" },
		{ family = "Hack Nerd Font Mono", weight = "Regular" },
		{ family = "MesloLGMDZ Nerd Font Mono", weight = "Regular" },
		{ family = "FiraCode Nerd Font Mono", weight = "Regular" },
		{ family = "MonaspiceNe Nerd Font", weight = "Regular" },
		{ family = "Cascadia Code", weight = "Regular" },
		"Symbols Nerd Font",
	}),
	automatically_reload_config = true,

	-- Window configuration
	enable_tab_bar = true,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	window_frame = {
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),
		font_size = 13.0,
		active_titlebar_bg = scheme_def.background,
	},

	window_decorations = "RESIZE",
	window_background_opacity = 1,
	window_padding = {
		left = 10,
		right = 10,
		top = 5,
		bottom = 5,
	},
	initial_cols = 300,
	initial_rows = 120,
	max_fps = 240,
	-- Tab bar configuration
	scrollback_lines = 35000,
	enable_scroll_bar = true,
	colors = {
		tab_bar = {
			-- The color of the inactive tab bar edge/divider
			inactive_tab_edge = "#FFFFFF",
		},
	},
}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
	options = {
		theme = scheme,
	},
})
--
-- tabline.apply_to_config(config)
-- local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
-- bar.apply_to_config(config, { position = "top" })
--
require("keys").setup(config)

-- Return the configuration to wezterm
return config
