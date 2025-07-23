return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "mikavilpas/blink-ripgrep.nvim",
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts = {
      keymap = {
        preset = "enter",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },

        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
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
          "avante",
          "lsp",
          "ripgrep",
          "path",
          "snippets",
          "buffer",
        },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            opts = {
              prefix_min_len = 3,
              context_size = 5,
              max_filesize = "1M",
              project_root_marker = ".git",
              project_root_fallback = true,
              search_casing = "--ignore-case",
              additional_rg_options = {},
              ignore_paths = {},
              additional_paths = {},
              future_features = {
                toggles = {
                  on_off = "<leader>tg",
                },
              },
              debug = false,
            },
            transform_items = function(_, items)
              for _, item in ipairs(items) do
                item.labelDetails = {
                  description = "(rg)",
                }
              end
              return items
            end,
          },
        },
      },
    },
  },
}
