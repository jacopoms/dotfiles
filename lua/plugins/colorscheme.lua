return {
  {
    "yorik1984/newpaper.nvim",
    opts = {
      style = "dark",
      lualine_style = "dark",
      lightness = 0.1,
      keywords = "bold,italic",
      borders = true,
      disable_background = false,
      sidebars_contrast = { "NvimTree", "packer", "Neotest", "SymbolsOutline" },
      custom_highlights = {
        GitSignsCurrentLineBlame = { fg = "#778899" },
      },
    },
  },
  { "yorik1984/lualine-theme.nvim" },
  -- 0Configure LazyVim to load newpaper colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "newpaper",
    },
  },
}
