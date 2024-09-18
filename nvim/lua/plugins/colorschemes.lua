local Util = require("lazyvim.util")

-- Define keys once and reuse it
local keys = {
  { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
}

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    keys = keys,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    keys = keys,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = { style = "dark" },
    keys = keys,
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
    keys = keys,
  },
  {
    "uloco/bluloco.nvim",
    lazy = true,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    keys = keys,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    priority = 1000,
    keys = keys,
  },
  {
    "0xstepit/flow.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      -- transparent = true,
      fluo_color = "green",
      aggressive_spell = true,
    },
    keys = keys,
  },
  -- Configure LazyVim to load newpaper colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "bluloco",
    },
  },
}
