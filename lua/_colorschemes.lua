-- onedark
-- require("onedark").setup({
-- 	style = "deep",
-- })

-- -- Load the colorscheme
vim.cmd([[set background=dark]])
vim.cmd([[set termguicolors]])
-- vim.cmd([[colorscheme dracula]])
vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#778899]])

require("newpaper").setup({
	style = "dark",
	lualine_style = "dark",
	keywords = "bold,italic",
	disable_background = true,
	sidebars_contrast = { "NvimTree", "packer", "Neotest", "Spectre", "SymbolsOutline" },
})

require("colorizer").setup()
