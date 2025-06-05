return {
  "kiddos/gemini.nvim",
  event = "BufEnter",
  config = function()
    require("gemini").setup()
  end,
  keys = {
    { "<leader>agu", "<cmd>GeminiUnitTest<cr>", desc = "Generate Unit Tests with Gemini" },
    { "<leader>agc", "<cmd>GeminiCodeReview<cr>", desc = "Generate Code Review with Gemini" },
    { "<leader>age", "<cmd>GeminiCodeExplain<cr>", desc = "Expain Code with Gemini" },
    { "<leader>aga", "<cmd>GeminiChat<cr>", desc = "Open Chat with Gemini" },
  },
}
