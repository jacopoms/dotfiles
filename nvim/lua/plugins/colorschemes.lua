return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "cool" },
    init = function()
      require("onedark").load()
    end,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = false,
      style = "light",
    },
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
    -- "uloco/bluloco.nvim",
    "mistweaverco/bluloco.nvim",
    -- dependencies = { "rktjmp/lush.nvim" },
    opts = {
      italics = true,
      -- theme = "dark",
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
  -- Configure LazyVim to load  colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark", -- catppuccin-macchiato",
    },
  },
}
