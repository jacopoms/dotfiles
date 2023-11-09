return {
  {
    "yorik1984/newpaper.nvim",
    opts = {
      style = "dark",
      lualine_style = "dark",
      keywords = "bold,italic",
      borders = true,
      disable_background = false,
      sidebars_contrast = { "NvimTree", "packer", "Neotest", "SymbolsOutline" },
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
