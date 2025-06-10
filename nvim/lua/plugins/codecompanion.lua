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
          env = {
            api_key = "AIzaSyCZyQ_mh76MYcWJwj-3O35uXQGN-IwCcSk",
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
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
  },
}
