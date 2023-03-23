-- onedark
-- require("onedark").setup({
--   style = "deep"
-- })

require("newpaper").setup({
	style = "light",
	lualine_style = "light",
	keywords = "bold,italic",
	sidebars_contrast = { "NvimTree", "packer" },
})

-- -- Load the colorscheme
vim.cmd([[set background=dark]])
vim.cmd([[set termguicolors]])
-- vim.cmd([[colorscheme solarized8_high]])
vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#778899]])

-- Setting up colorizer in newvim
require("colorizer").setup()

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	pattern = { "*" },
-- 	command = [[%s/\s\+$//e]],
-- })
