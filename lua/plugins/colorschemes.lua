return {
	{ "navarasu/onedark.nvim", lazy = true },
	{ "lifepillar/vim-solarized8", lazy = true },
	{
		"yorik1984/newpaper.nvim",
		lazy = false,
		config = function()
			require("newpaper").setup({
				style = "dark",
				lualine_style = "dark",
				keywords = "bold,italic",
				borders = true,
				disable_background = false,
				sidebars_contrast = { "NvimTree", "packer", "Neotest", "SymbolsOutline" },
			})
		end,
	},
	{ "NLKNguyen/papercolor-theme", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "pineapplegiant/spaceduck", lazy = true },
}
-- onedark
-- require("onedark").setup({
-- style = "cool",
-- })

-- vim.cmd([[set background=light]])
-- vim.cmd([[highlight ColorColumn ctermbg=lightgrey guibg=#444444]])
