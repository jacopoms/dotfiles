-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.log_info("reloading")

local appearance = wezterm.gui.get_appearance()

local function scheme_for_appearance(appearance)
	return "Dracula"
end

-- Configuration options
local scheme = os.getenv("WEZTERM_COLOR_SCHEME") or scheme_for_appearance(appearance)
local font_size = tonumber(os.getenv("WEZTERM_FONT_SIZE")) or 12.5

-- Obtain the definition of the selected color scheme
local builtin_schemes = wezterm.color.get_builtin_schemes()
local scheme_def = builtin_schemes[scheme]
local titlebar_bg = (scheme_def and scheme_def.background) or "#24283b"
-- print a line here in the shell to see the value of scheme

local log_line = string.format("Selected color scheme: %s, titlebar background: %s", scheme, titlebar_bg)

wezterm.log_info(log_line)

config = {
	-- General settings
	color_scheme = scheme,
	font_size = font_size,
	font = wezterm.font_with_fallback({
		{ family = "CaskaydiaCove Nerd Font", weight = "Regular" },
		{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
		{ family = "JetBrains Mono", weight = "Regular" },
		{ family = "Hack Nerd Font Mono", weight = "Regular" },
		{ family = "MesloLGMDZ Nerd Font Mono", weight = "Regular" },
		{ family = "FiraCode Nerd Font Mono", weight = "Regular" },
		{ family = "MonaspiceNe Nerd Font", weight = "Regular" },
		{ family = "Cascadia Code", weight = "Regular" },
		"Symbols Nerd Font",
	}),
	-- Simulate font thickening (closest WezTerm equivalent to Ghostty's font-thicken)
	bold_brightens_ansi_colors = "BrightAndBold",
	automatically_reload_config = true,

	-- Window configuration
	enable_tab_bar = true,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	window_frame = {
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),
		font_size = 13.0,
		active_titlebar_bg = scheme_def.background,
		inactive_titlebar_bg = scheme_def.background,
	},

	window_decorations = "RESIZE",
	window_background_opacity = 0.95,
	window_padding = {
		left = 5,
		right = 5,
		top = 2,
		bottom = 0,
	},
	initial_cols = 300,
	initial_rows = 120,
	max_fps = 240,
	-- Mouse
	hide_mouse_cursor_when_typing = true,
	-- Tab bar configuration
	scrollback_lines = 35000,
	enable_scroll_bar = true,
	colors = {
		tab_bar = {
			background = scheme_def.background,
			inactive_tab_edge = scheme_def.ansi and scheme_def.ansi[1] or "#333333",
			active_tab = {
				bg_color = scheme_def.background,
				fg_color = scheme_def.foreground,
			},
			inactive_tab = {
				bg_color = wezterm.color.parse(scheme_def.background):darken(0.5),
				fg_color = scheme_def.ansi and scheme_def.ansi[8] or "#808080",
			},
			inactive_tab_hover = {
				bg_color = wezterm.color.parse(scheme_def.background):lighten(0.05),
				fg_color = scheme_def.foreground,
				italic = true,
			},
			new_tab = {
				bg_color = scheme_def.background,
				fg_color = scheme_def.foreground,
			},
			new_tab_hover = {
				bg_color = wezterm.color.parse(scheme_def.background):lighten(0.05),
				fg_color = scheme_def.foreground,
				italic = true,
			},
		},
	},

	-- Alt/Option key configuration for macOS
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
}

require("keys").setup(config)

-- Copy on select (like Ghostty's copy-on-select = clipboard)
-- Extend mouse bindings to copy to clipboard on mouse release after selection
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor("Clipboard"),
	},
}

-- Return the configuration to wezterm
return config
