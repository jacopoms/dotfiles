-- onedark
require("onedark").setup({
	style = "deep",
})

require("newpaper").setup({
	style = "dark",
	lualine_style = "dark",
	keywords = "bold,italic",
	sidebars_contrast = { "NvimTree", "packer", "Neotest", "Spectre", "SymbolsOutline" },
})

-- -- Load the colorscheme
vim.cmd([[set background=dark]])
vim.cmd([[set termguicolors]])
vim.cmd([[colorscheme newpaper]])
vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#778899]])

-- Setting up colorizer in newvim
require("colorizer").setup()
