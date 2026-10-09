return {

  {
    "drsh4dow/blink-ai.nvim",
    dependencies = { "saghen/blink.cmp" },
    opts = {
      provider = "ollama",
      providers = {
        ollama = {
          model = "dagbs/qwen2.5-coder-1.5b-instruct-abliterated:q4_k_m",
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "mikavilpas/blink-ripgrep.nvim",
      "folke/sidekick.nvim",
      "drsh4dow/blink-ai.nvim",
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
          "ai",
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
          ai = {
            name = "AI",
            module = "blink-ai",
            async = true,
            timeout_ms = 5000,
            score_offset = 10,
            -- blink-ai's suggestion text is arbitrary generated code, not a
            -- continuation of the typed prefix, so fuzzy-matching it against
            -- item.label (as blink.cmp does when filterText == "") fails as
            -- soon as any keyword character is typed and the suggestion
            -- disappears. Force filterText to the keyword currently being
            -- typed so AI items always pass the fuzzy filter.
            transform_items = function(ctx, items)
              local keyword = ctx.line:sub(ctx.bounds.start_col, ctx.cursor[2])
              for _, item in ipairs(items) do
                item.filterText = keyword
              end
              return items
            end,
          },
        },
      },
    },
  },
}
