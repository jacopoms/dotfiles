return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      style = "cool", -- dark, darker, cool, deep, warm, warmer
      transparent = true,
      -- Snacks picker list: default links this group to `Visual` (deep bg3 #2a324a).
      colors = {
        snacks_picker_cursor = "#3d5070",
      },
      highlights = {
        SnacksPickerListCursorLine = { bg = "$snacks_picker_cursor" },
        FloatBorder = { bg = "$bg1" },
        NormalFloat = { bg = "$bg1" },
        NeoTreeEndOfBuffer = { bg = "$bg_d" },
        NeoTreeNormal = { bg = "$bg_d" },
        NeoTreeNormalNC = { bg = "$bg_d" },
        NeoTreeVertSplit = { bg = "$bg_d" },
        NeoTreeWinSeparator = { bg = "$bg_d" },
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = false,
      -- style = "light",
    },
  },
  {
    "yorik1984/newpaper.nvim",
    lazy = true,
    opts = {
      style = "light",
      custom_highlights = {
        GitSignsCurrentLineBlame = { fg = "#778899" },
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    branch = "main",
    version = false,
    lazy = true,
    priority = 1000,
    opts = {
      flavor = "macchiato", -- latte, frappe, macchiato, mocha
      neo_tree = true,
      blink_cmp = true,
      snacks = {
        enabled = true,
        indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
      },
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      dim_inactive = true,
      -- hide_end_of_buffer = false, -- Hide the '~' character at the end of the buffer for a cleaner look
      hide_nc_statusline = false, -- Override the underline style for non-active statuslines
    },
  },
  {
    -- "uloco/bluloco.nvim",
    "mistweaverco/bluloco.nvim",
    -- dependencies = { "rktjmp/lush.nvim" },
    lazy = true,
    opts = {
      italics = true,
      theme = "light",
    },
  },
  {
    "edmondburnett/leeward.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      theme = "dark",
    },
    -- config = function()
    --     require("leeward").setup()
    --     require("leeward").load()
    -- end
  },
  -- lua/plugins/rose-pine.lua
  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  -- Configure LazyVim to load  colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark", -- rose-pine-dawn, tokyonight-storm
    },
  },
}
