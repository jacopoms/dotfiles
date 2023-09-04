local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-github.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "LinArcX/telescope-env.nvim" },
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use("mg979/vim-visual-multi")
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		requires = "neovim/nvim-lspconfig",
	})
	use("folke/neodev.nvim")
	use("mhartington/formatter.nvim")

	-- completion engine
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- auto complete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"ray-x/cmp-treesitter",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
		},
	})
	-- tabnine AI Assistant
	-- use({
	--   "tzachar/cmp-tabnine",
	--   run = "./install.sh",
	--   requires = "hrsh7th/nvim-cmp",
	-- })
	-- use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })

	-- Github Copilot
	-- use({ "github/copilot.vim" })
	-- use({ "zbirenbaum/copilot.lua" })
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
				},
				panel = {
					enabled = false,
				},
				copilot_node_command = "/Users/jacopo/.asdf/installs/nodejs/20.5.0/bin/node",
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
	-- Tell which key
	use({ "folke/which-key.nvim" })
	-- use({ "ziontee113/syntax-tree-surfer" })
	use({
		"akinsho/nvim-bufferline.lua",
		tags = "*",
		requires = "nvim-tree/nvim-web-devicons",
	})
	use({
		"danymat/neogen",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
		},
		-- Uncomment next line if you want to follow only stable versions
		tag = "*",
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})

	-- use({ "tbastos/vim-lua" })
	use({ "lewis6991/hover.nvim" })
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-rhubarb" }) -- open file on github
	use({ "RRethy/nvim-treesitter-endwise" })
	use({ "machakann/vim-highlightedyank" })
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use({ "vim-ruby/vim-ruby" })
	use({ "kchmck/vim-coffee-script" })
	use({ "jlcrochet/vim-rbs" })
	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})
	use({ "elixir-editors/vim-elixir" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "simrat39/symbols-outline.nvim" })
	use({
		"windwp/nvim-spectre",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	-- ' color schemes
	use({ "navarasu/onedark.nvim" })
	use({ "lifepillar/vim-solarized8" })
	use({ "yorik1984/newpaper.nvim" })
	use({ "NLKNguyen/papercolor-theme" })
	use({ "rebelot/kanagawa.nvim" })
	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({ "ryanoasis/vim-devicons" })
	use({ "yorik1984/lualine-theme.nvim" })
	-- use({ "arkav/lualine-lsp-progress" })
	use({ "nvim-lua/lsp-status.nvim" })
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "folke/todo-comments.nvim" })
	use({ "vim-test/vim-test" })
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"olimorris/neotest-rspec",
			"nvim-neotest/neotest-vim-test",
		},
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({ "norcalli/nvim-colorizer.lua" })
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
