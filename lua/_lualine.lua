vim.g.newpaper_lualine_bold = true --default
local lualine = require("lualine")
local config = {
	options = {
		theme = "newpaper-dark",
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		section_separators = { "", "" },
		-- component_separators = { "│", "│" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_b = {
			{
				"diff",
				colored = true,
				diff_color = {
					-- specific colors from theme with bg color of section
					added = "GitSignsAdd",
					modified = "GitSignsChange",
					removed = "GitSignsDelete",
					-- added = { fg = "#28A745" },
					-- modified = { fg = "#DBAB09" },
					-- removed = { fg = "#D73A49" },
				},
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
		},
		lualine_c = {
			{
				"filename",
				path = 1,
			},
			{ "branch", icon = "" },
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					-- specific colors from theme with bg color of section
					error = "LualineDiagnosticError",
					warn = "LualineDiagnosticWarn",
					info = "LualineDiagnosticInfo",
					hint = "LualineDiagnosticHint",
					-- error = { fg = "#AF0000" },
					-- warn = { fg = "#D75F00" },
					-- info = { fg = "#0087AF" },
					-- hint = { fg = "#008700" },
				},
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = " ",
				},
			},
			"lsp_progress",
			"searchcount",
		},
		lualine_y = { "fileformat", "filetype", "encoding", "progress" },
	},
	extensions = {
		"fugitive",
		"nvim-tree",
	},
}
lualine.setup(config)
