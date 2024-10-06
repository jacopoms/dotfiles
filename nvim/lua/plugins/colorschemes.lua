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
      lightness = 0.3,
      saturation = 0,
      -- greyscale = "lightness",
      contrast_telescope = false,
      contrast_float = false,
      keywords = "bold,italic",
      borders = true,
      disable_background = true,
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
    opts = {
      transparent = true,
    },
    keys = keys,
  },
  {
    "kartikp10/noctis.nvim",
    lazy = true,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    keys = keys,
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = true,
    priority = 1000,
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
  {
    "sontungexpt/witch",
    lazy = true,
    priority = 1000,
    keys = keys,
  },
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "vulgaris",
      transparent = true,
    },
    keys = keys,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      contrast = {
        terminal = true, -- Enable contrast for the built-in terminal
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
      },
      high_visibility = {
        lighter = true, -- Enable higher contrast text for lighter style
        darker = true, -- Enable higher contrast text for darker style
      },
    },
    init = function()
      -- vim.g.material_style = "deep ocean"
      require("material.functions").change_style("deep ocean")
    end,
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
