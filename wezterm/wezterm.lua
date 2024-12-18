-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.log_info("reloading")

-- Configuration options
local scheme = os.getenv("WEZTERM_COLOR_SCHEME") or "tokyonight"
local font_size = tonumber(os.getenv("WEZTERM_FONT_SIZE")) or 12.5

-- Obtain the definition of the selected color scheme
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]

config = {
	-- General settings
	color_scheme = scheme,
	font_size = font_size,
	font = wezterm.font_with_fallback({
		{ family = "MesloLGMDZ Nerd Font Mono", weight = "Regular" },
		{ family = "Hack Nerd Font Mono", weight = "Regular" },
		{ family = "FiraCode Nerd Font Mono", weight = "Regular" },
		{ family = "MonaspiceNe Nerd Font", weight = "Regular" },
		{ family = "Cascadia Code", weight = "Regular" },
		{ family = "Symbols Nerd Font" },
	}),
	automatically_reload_config = true,

	-- Window configuration
	-- window_frame = {
	-- 	font = wezterm.font({ family = "Roboto", weight = "Bold" }),
	-- 	font_size = 14.0,
	-- 	active_titlebar_bg = scheme_def.background,
	-- 	inactive_titlebar_bg = "#333333",
	-- },
	window_decorations = " RESIZE",
	window_background_opacity = 1,
	window_padding = {
		left = 6,
		right = 6,
		top = 8,
		bottom = 8,
	},
	initial_cols = 300,
	initial_rows = 120,
	max_fps = 240,
	-- Tab bar configuration
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	scrollback_lines = 35000,
	enable_scroll_bar = true,
}

-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
--
-- tabline.setup({
-- 	options = {
-- 		theme = "Tokyo Night",
-- 	},
-- })
--
-- tabline.apply_to_config(config)

require("keys").setup(config)

-- Return the configuration to wezterm
return config
