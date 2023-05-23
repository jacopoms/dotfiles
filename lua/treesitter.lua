local ts_config = require("nvim-treesitter.configs")

ts_config.setup({
	auto_install = true,
	ensure_installed = {
		"lua",
		"ruby",
		"elixir",
		"dockerfile",
		"css",
		"html",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	endwise = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})

require("symbols-outline").setup()
