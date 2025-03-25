return {
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    opts = { style = "cool" },
    init = function()
      require("onedark").load()
    end,
  },
  {
    "maxmx03/solarized.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
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
      custom_highlights = {
        GitSignsCurrentLineBlame = { fg = "#778899" },
      },
    },
  },
  {
    -- "uloco/bluloco.nvim",
    "mistweaverco/bluloco.nvim",
    -- dependencies = { "rktjmp/lush.nvim" },
    opts = {
      italics = true,
      theme = "light",
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true,
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = true,
    opts = {},
  },
  {
    "neanias/everforest-nvim",
    name = "everforest",
    lazy = true,
    priority = 1000,
    opts = {
      background = "medium",
      transparent_background_level = 0,
      italics = true,
      disable_italic_comments = false,
    },
  },
  -- Configure LazyVim to load  colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
