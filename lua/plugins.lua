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
			{ "LinArcX/telescope-env.nvim" },
		},
	})
	use({
		"sudormrfbin/cheatsheet.nvim",

		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use("famiu/nvim-reload")
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		requires = "neovim/nvim-lspconfig",
	})
	use("mhartington/formatter.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	-- completion engine

	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- use("hrsh7th/nvim-cmp")
	-- use("hrsh7th/cmp-buffer")
	-- use("hrsh7th/cmp-path")
	-- use("hrsh7th/cmp-cmdline")
	-- use("hrsh7th/cmp-emoji")
	-- use("hrsh7th/cmp-nvim-lua")
	-- use("hrsh7th/cmp-nvim-lsp")
	-- use("ray-x/cmp-treesitter")
	-- use("onsails/lspkind.nvim")
	-- use("saadparwaiz1/cmp_luasnip")
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
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})
	-- Tell which key
	use({ "folke/which-key.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "ziontee113/syntax-tree-surfer" })
	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"danymat/neogen",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/vim-vsnip",
		},
		-- Uncomment next line if you want to follow only stable versions
		tag = "*",
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "lewis6991/hover.nvim" })
	-- use 'glepnir/lspsaga.nvim'
	-- use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb") -- open file on github
	use("RRethy/nvim-treesitter-endwise")
	use("ryanoasis/vim-devicons")
	use("machakann/vim-highlightedyank")
	use("vim-ruby/vim-ruby")
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
	use("elixir-editors/vim-elixir")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "simrat39/symbols-outline.nvim" })
	use({
		"windwp/nvim-spectre",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	-- ' color schemes
	-- use 'EdenEast/nightfox.nvim'
	use("navarasu/onedark.nvim")
	-- use 'folke/tokyonight.nvim'
	use("projekt0n/github-nvim-theme")
	use("lifepillar/vim-solarized8")
	-- use 'sainnhe/sonokai'
	use("marko-cerovac/material.nvim")
	use("yorik1984/newpaper.nvim")
	use({ "mhartington/oceanic-next", opt = true })

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("cwebster2/github-coauthors.nvim")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("vim-test/vim-test")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("norcalli/nvim-colorizer.lua")
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
