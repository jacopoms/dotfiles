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
    ---@type solarized.config
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
    "sainnhe/everforest",
    name = "everforest",
    lazy = true,
    priority = 1000,
    init = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_better_performance = 1
    end,
  },
  -- Configure LazyVim to load  colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
