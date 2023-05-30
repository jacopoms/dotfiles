-- local actions = require("telescope.actions")
require("telescope").load_extension("media_files")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("githubcoauthors")
require("telescope").load_extension("fzf")
require("telescope").load_extension("gh")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("env")

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=auto",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			height = 25,
			bottom_pane = {
				mirror = false,
				preview_width = 0.5,
				prompt_position = "top",
			},
			horizontal = {
				width = 0.95,
				height = 0.95,
				prompt_position = "top",
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = true,
		borderchars = {
			prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
			results = { " " },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	pickers = {
		find_files = {
			theme = "ivy",
			-- hidden = true
		},
		buffers = {
			show_all_buffers = true,
			sort_lastused = true,
			-- theme = "dropdown",
			-- previewer = false,
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
			},
		},
		colorscheme = {
			enable_preview = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		file_browser = {
			theme = "ivy",
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

-- highlight

local M = {}

local telescope_builtin = require("telescope.builtin")

M.find_files = function()
	telescope_builtin.find_files({
		find_command = { "rg", "--files", "--iglob", "!.git" },
		previewer = true,
	})
end

M.diagnostics = function()
	telescope_builtin.diagnostics({
		bufnr = nil,
	})
end

vim.cmd("hi TelescopeBorder   guifg=#2a2e36")
vim.cmd("hi TelescopePromptBorder   guifg=#2a2e36")
vim.cmd("hi TelescopeResultsBorder  guifg=#2a2e36")
vim.cmd("hi TelescopePreviewBorder  guifg=#525865")

return M
