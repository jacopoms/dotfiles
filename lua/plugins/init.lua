return {
	{ "mg979/vim-visual-multi" },
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		dependencies = "neovim/nvim-lspconfig",
	},
	{ "folke/neodev.nvim" },

	-- Tell which key
	{ "folke/which-key.nvim" },
	-- { "ziontee113/syntax-tree-surfer" },
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		keys = {
			{ "<leader>dfo", "<cmd>DiffviewOpen<CR>", noremap = true },
			{ "<leader>dff", "<cmd>DiffviewFileHistory %<CR>", noremap = true },
			{ "<leader>dc", "<cmd>DiffviewClose<CR>", noremap = true },
		},
	},

	-- { "tbastos/vim-lua" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" }, -- open file on github
	{ "RRethy/nvim-treesitter-endwise" },
	{ "machakann/vim-highlightedyank" },
	{ "vim-ruby/vim-ruby" },
	{ "kchmck/vim-coffee-script" },
	{ "jlcrochet/vim-rbs" },
	{
		"akinsho/git-conflict.nvim",
		event = { "BufNewFile", "BufReadPre", "FileReadPre" },
		version = "*",
	},
	{ "elixir-editors/vim-elixir" },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufNewFile", "BufReadPre", "FileReadPre" },
	},
	{
		"simrat39/symbols-outline.nvim",
		lazy = true,
		event = { "BufNewFile", "BufReadPre", "FileReadPre" },
		config = function()
			require("symbols-outline").setup({
				highlight_hovered_item = true,
				show_guides = true,
				auto_preview = false,
				position = "right",
				width = 25,
				show_numbers = false,
				show_relative_numbers = false,
				show_symbol_details = true,
				preview_bg_highlight = "Pmenu",
				keymaps = {
					close = "<Esc>",
					goto_location = "<Cr>",
					focus_location = "o",
					hover_symbol = "<C-space>",
					rename_symbol = "r",
					code_actions = "a",
				},
				lsp_blacklist = {},
			})
		end,
		keys = {
			{ "<leader>oo", "<cmd>SymbolsOutline<CR>", noremap = true },
		},
	},
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{ "ryanoasis/vim-devicons" },
	{ "yorik1984/lualine-theme.nvim" },
	{
		"Bekaboo/deadcolumn.nvim",
		event = "BufWritePre",
		opts = { warning = { colorcode = "#444444" } },
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufNewFile", "BufReadPre", "FileReadPre" },
	},
	{
		"vim-test/vim-test",
		event = { "BufNewFile", "BufReadPre", "FileReadPre" },
	},
	{ "norcalli/nvim-colorizer.lua" },
	{
		"windwp/nvim-autopairs",
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
}
