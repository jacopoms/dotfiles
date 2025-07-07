return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  opts = {
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemini-2.0-flash",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "gemini",

        opts = {
          completion_provider = "blink", -- blink|cmp|coc|default
        },
      },
      inline = {
        adapter = "gemini",
        opts = {
          completion_provider = "blink", -- blink|cmp|coc|default
        },
      },
      cmd = {
        adapter = "gemini",
      },
    },
  },
  keys = {
    { "<leader>acc", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion Actions", mode = { "n", "v" } },
    { "<leader>act", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Tgggle Code Companion", mode = { "n", "v" } },
    { "<leader>aca", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to Code Companion chat", mode = { "v" } },
    { "<leader>aci", "<cmd>CodeCompanionInlineAssist<cr>", desc = "Inline AI Assist", mode = { "i", "n" } },
  },
}
