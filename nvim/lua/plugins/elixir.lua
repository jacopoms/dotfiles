return {
  "elixir-tools/elixir-tools.nvim",
  verson = "*",
  enabled = false,
  event = { "BufReadPre", "BufNewFle" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup({
      nextls = { enable = false },
      elixirls = {
        enable = true,
        settings = elixirls.settings({
          dialyzerEnabled = false,
          enableTestLenses = false,
        }),
      },
      projectionist = {
        enable = true,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
