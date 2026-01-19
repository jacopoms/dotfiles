return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "mikavilpas/blink-ripgrep.nvim",
      "folke/sidekick.nvim",
    },
    lazy = false,
    version = "*",
    opts = {
      keymap = {
        preset = "super-tab",
      },
      completion = {
        menu = {
          border = "rounded",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = "rounded",
          },
        },
      },
      sources = {
        default = {
          "lsp",
          "ripgrep",
          "path",
          "buffer",
          "snippets",
        },
        providers = {
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            enabled = true,
            opts = {
              debug = true,
            },
          },
        },
      },
    },
  },
}
