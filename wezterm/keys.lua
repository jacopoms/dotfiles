local wezterm = require("wezterm") --[[@as WezTerm]]

local act = wezterm.action
local M = {}
M.mod = "CMD" or "SUPER" or "WIN"

M.smart_split = wezterm.action_callback(function(window, pane)
	local dim = pane:get_dimensions()
	if dim.pixel_height > dim.pixel_width then
		window:perform_action(act.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
	else
		window:perform_action(act.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
	end
end)

---@class Config
---@field disable_default_key_bindings boolean
---@field keys table

---@param config Config
function M.setup(config)
	config.disable_default_key_bindings = true
	config.keys = {
		--Scrollback
		{ mods = M.mod, key = "k", action = act.ScrollByPage(-0.5) },
		{ mods = M.mod, key = "j", action = act.ScrollByPage(0.5) },
		-- New Tab
		{ mods = M.mod, key = "t", action = act.SpawnTab("CurrentPaneDomain") },
		-- { mods = M.mod, key = "t", action = wezterm.action.SendString("\x02\x54") },
		-- Move Tabs
		{ mods = M.mod, key = ">", action = act.MoveTabRelative(1) },
		{ mods = M.mod, key = "<", action = act.MoveTabRelative(-1) },
		-- Activate Tabs
		{ mods = M.mod, key = "l", action = act({ ActivateTabRelative = 1 }) },
		{ mods = M.mod, key = "h", action = act({ ActivateTabRelative = -1 }) },
		{ mods = M.mod, key = "R", action = act.RotatePanes("Clockwise") },
		-- close current tabe
		{ mods = M.mod, key = "w", action = act.CloseCurrentPane({ confirm = true }) },
		-- show the pane selection mode, but have it swap the active and selected panes
		{ mods = M.mod, key = "S", action = wezterm.action.PaneSelect({}) },
		{ mods = M.mod, key = "H", action = wezterm.action.ActivatePaneDirection("Left") },
		{ mods = M.mod, key = "L", action = wezterm.action.ActivatePaneDirection("Right") },
		{ mods = M.mod, key = "J", action = wezterm.action.ActivatePaneDirection("Down") },
		{ mods = M.mod, key = "K", action = wezterm.action.ActivatePaneDirection("Up") },
		-- Splits
		{ mods = M.mod, key = "Enter", action = M.smart_split },
		{ mods = M.mod, key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ mods = M.mod, key = "_", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ mods = M.mod, key = "0", action = wezterm.action.ResetFontAndWindowSize },
		{ mods = M.mod, key = "(", action = act.DecreaseFontSize },
		{ mods = M.mod, key = ")", action = act.IncreaseFontSize },
		-- Clipboard
		{ mods = M.mod, key = "c", action = act.CopyTo("Clipboard") },
		{ mods = "CTRL", key = "Space", action = act.QuickSelect },
		{ mods = M.mod, key = "X", action = act.ActivateCopyMode },
		{ mods = M.mod, key = "f", action = act.Search("CurrentSelectionOrEmptyString") },
		{ mods = M.mod, key = "v", action = act.PasteFrom("Clipboard") },
		-- show Launcher
		{ mods = M.mod, key = "p", action = act.ActivateCommandPalette },
	}
end

return M
