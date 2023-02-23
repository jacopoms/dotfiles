require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,
		},
		ruby = {
			require("formatter.filetypes.ruby").rubocop,
		},
		elixir = {
			require("formatter.filetypes.elixir").mixformat,
		},
		graphql = {
			require("formatter.filetypes.graphql").prettier,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").eslint_d,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
	},
})

vim.keymap.set("n", "<space>fm", "<cmd>Format<CR>", opts)
vim.keymap.set("n", "<space>fmw", "<cmd>FormatWrite<CR>", opts)
