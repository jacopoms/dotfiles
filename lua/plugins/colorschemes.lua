local Util = require("lazyvim.util")
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    keys = {
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    keys = {
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = { style = "dark" },
    keys = {
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "yorik1984/newpaper.nvim",
    depedndencies = {
      "yorik1984/lualine-theme.nvim",
    },
    opts = {
      style = "dark",
      lualine_style = "dark",
      lightness = 0,
      keywords = "bold,italic",
      borders = true,
      disable_background = false,
      sidebars_contrast = { "NvimTree", "Neotest", "SymbolsOutline" },
      custom_highlights = {
        GitSignsCurrentLineBlame = { fg = "#778899" },
      },
    },
  },
  { "ellisonleao/gruvbox.nvim" },
  -- 0Configure LazyVim to load newpaper colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "newpaper",
    },
  },
}
