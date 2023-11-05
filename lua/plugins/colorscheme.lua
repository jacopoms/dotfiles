return {
	{ "navarasu/onedark.nvim" },
	{ "lifepillar/vim-solarized8" },
	{
		"yorik1984/newpaper.nvim",
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
	{ "NLKNguyen/papercolor-theme" },
	{ "rebelot/kanagawa.nvim" },
	{ "pineapplegiant/spaceduck" },
}
-- onedark
-- require("onedark").setup({
-- style = "cool",
-- })

-- vim.cmd([[set background=light]])
-- vim.cmd([[highlight ColorColumn ctermbg=lightgrey guibg=#444444]])
