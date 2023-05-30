-- onedark
require("onedark").setup({
  style = "cool",
})

require("newpaper").setup({
  style = "dark",
  lualine_style = "dark",
  keywords = "bold,italic",
  disable_background = true,
  sidebars_contrast = { "NvimTree", "packer", "Neotest", "Spectre", "SymbolsOutline" },
})
vim.cmd([[set background=dark]])
vim.cmd([[set termguicolors]])
-- vim.cmd([[colorscheme gruvbox-baby]])
vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#778899]])

require("colorizer").setup()
