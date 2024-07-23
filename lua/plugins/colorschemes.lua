local Util = require("lazyvim.util")
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = { style = "dark" },
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
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
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "NTBBloodbath/doom-one.vim",
    lazy = true,
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "kepano/flexoki-neovim",
    lazy = true,
    name = "flexoki",
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "uloco/bluloco.nvim",
    lazy = true,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "kartikp10/noctis.nvim",
    lazy = true,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "dasupradyumna/midnight.nvim",
    lazy = true,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    priority = 1000,
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      fluo_color = "green",
      aggressive_spell = true,
    },
    keys = {
      { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  -- Configure LazyVim to load newpaper colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "flow",
    },
  },
}
