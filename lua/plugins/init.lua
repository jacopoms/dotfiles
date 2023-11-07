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
	{ "sindrets/diffview.nvim" },
	{
		"akinsho/nvim-bufferline.lua",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
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
		version = "*",
		config = function()
			require("git-conflict").setup()
		end,
	},
	{ "elixir-editors/vim-elixir" },
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	-- ' color schemes
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{ "ryanoasis/vim-devicons" },
	{ "yorik1984/lualine-theme.nvim" },
	-- { "arkav/lualine-lsp-progress" },
	{
		"Bekaboo/deadcolumn.nvim",
		config = function()
			local opts = { warning = { colorcode = "#444444" } }
			require("deadcolumn").setup(opts)
		end,
	},
	-- { "nvim-lua/lsp-status.nvim" },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "vim-test/vim-test" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
}
