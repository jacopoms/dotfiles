return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-github.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "LinArcX/telescope-env.nvim" },
		},
	},
	{ "mg979/vim-visual-multi" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		dependencies = "neovim/nvim-lspconfig",
	},
	{ "folke/neodev.nvim" },

	-- completion engine
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },
	-- auto complete
	-- tabnine AI Assistant
	-- {
	--   "tzachar/cmp-tabnine",
	--   build = "./install.sh",
	--   dependencies = "hrsh7th/nvim-cmp",
	-- },
	-- { "codota/tabnine-nvim", build = "./dl_binaries.sh" },

	-- Github Copilot
	-- { "github/copilot.vim" },
	-- Tell which key
	{ "folke/which-key.nvim" },
	-- { "ziontee113/syntax-tree-surfer" },
	{ "sindrets/diffview.nvim" },
	{
		"akinsho/nvim-bufferline.lua",
		versions = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"danymat/neogen",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
		},
		-- Uncomment next line if you want to follow only stable versions
		version = "*",
	},

	-- { "tbastos/vim-lua" },
	{ "lewis6991/hover.nvim" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" }, -- open file on github
	{ "RRethy/nvim-treesitter-endwise" },
	{ "machakann/vim-highlightedyank" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
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
	{ "folke/todo-comments.nvim" },
	{ "vim-test/vim-test" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"olimorris/neotest-rspec",
			"nvim-neotest/neotest-vim-test",
		},
	},
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
