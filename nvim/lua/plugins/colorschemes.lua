return {
  {
    "folke/tokyonight.nvim",
    opts = { style = "storm" },
  },
  {
    -- "navarasu/onedark.nvim",
    "olimorris/onedarkpro.nvim",
    -- opts = { style = "dark" },
  },
  {
    "maxmx03/solarized.nvim",
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
    },
  },
  {
    "marko-cerovac/material.nvim",
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
        "mini",
        "neotest",
        "neo-tree",
        "noice",
        "nvim-cmp",
        "nvim-web-devicons",
        "rainbow-delimiters",
        "trouble",
        "which-key",
        "nvim-notify",
      },
    },
    init = function()
      -- vim.g.material_style = "deep ocean"
      -- require("material.functions").change_style("darker")
    end,
  },
  {
    "sekke276/dark_flat.nvim",
  },
  -- Configure LazyVim to load  colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "bluloco",
    },
  },
}
