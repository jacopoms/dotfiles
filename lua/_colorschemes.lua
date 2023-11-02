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
-- vim.cmd([[colorscheme  spaceduck]])
vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#778899]])
-- vim.cmd([[highlight ColorColumn ctermbg=lightgrey guibg=#444444]])
require("colorizer").setup()
