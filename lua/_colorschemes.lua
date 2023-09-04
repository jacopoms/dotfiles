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
	sidebars_contrast = { "NvimTree", "packer", "Neotest", "Spectre", "SymbolsOutline" },
})

vim.cmd([[set background=dark]])
vim.cmd([[set termguicolors]])
-- vim.cmd([[colorscheme  kanagawa-wave]])
vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#778899]])
vim.cmd([[highlight ColorColumn ctermbg=16 guibg=#4E4E4E]])
require("colorizer").setup()
