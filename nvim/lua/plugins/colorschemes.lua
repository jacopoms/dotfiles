local Util = require("lazyvim.util")

-- Define keys once and reuse it
local keys = {
  { "<leader>uC", Util.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
}

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    keys = keys,
  },
  {
    -- "navarasu/onedark.nvim",
    "olimorris/onedarkpro.nvim",
    lazy = true,
    -- opts = { style = "dark" },
    keys = keys,
  },
  {
    "maxmx03/solarized.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "yorik1984/newpaper.nvim",
    depedndencies = {
      "yorik1984/lualine-theme.nvim",
    },
    lazy = true,
    opts = {
      style = "light",
      lualine_style = "light",
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
    -- "uloco/bluloco.nvim",
    "mistweaverco/bluloco.nvim",
    lazy = true,
    priority = 1000,
    -- dependencies = { "rktjmp/lush.nvim" },
    opts = {
      italics = true,
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
      plugins = {
        "dashboard",
        "gitsigns",
        "indent-blankline",
        "mini",
        "neotest",
        "neo-tree",
        "noice",
        "nvim-cmp",
        "nvim-web-devicons",
        "rainbow-delimiters",
        "telescope",
        "trouble",
        "which-key",
        "nvim-notify",
      },
    },
    init = function()
      -- vim.g.material_style = "deep ocean"
      require("material.functions").change_style("darker")
    end,
    keys = keys,
  },
  {
    "sekke276/dark_flat.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    keys = keys,
  },
  -- Configure LazyVim to load newpaper colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon",
    },
  },
}
