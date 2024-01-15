local Util = require("lazyvim.util")
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
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
    lazy = true,
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
    keys = {
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    keys = {
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "romgrk/doom-one.vim",
    lazy = true,
    keys = {
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  -- Configure LazyVim to load catppuccin-latte colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "newpaper",
    },
  },
}
