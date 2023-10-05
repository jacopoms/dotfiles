-- onedark
-- require("onedark").setup({
-- style = "cool",
-- })
require("newpaper").setup({
	style = "dark",
	lualine_style = "dark",
	keywords = "bold,italic",
	borders = true,
	disable_background = false,
	sidebars_contrast = { "NvimTree", "packer", "Neotest", "SymbolsOutline" },
})

-- vim.cmd([[set background=light]])
vim.cmd([[set termguicolors]])
-- vim.cmd([[colorscheme  solarized8]])
vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#778899]])
-- vim.cmd([[highlight ColorColumn ctermbg=lightgrey guibg=#bbc2cf]])
require("colorizer").setup()
