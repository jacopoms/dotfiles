return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "ravitemer/mcphub.nvim" },
  },
  opts = {
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemini-2.5-flash",
            },
          },
        })
      end,
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "gpt-oss:latest",
            },
          },
        })
      end,
    },
    strategies = {
      chat = { adapter = "gemini" },
      inline = { adapter = "copilot" },
      cmd = { adapter = "gemini" },
    },
    opts = {
      log_level = "TRACE",
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
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
