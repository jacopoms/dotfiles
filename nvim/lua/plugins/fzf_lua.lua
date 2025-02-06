return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-treesitter/nvim-treesitter-context" },
  keys = {
    {
      "<leader>sf",
      "<cmd>FzfLua blines<CR>",
      noremap = true,
      desc = "Fuzzily search in current buffer",
    },
    {
      "<leader>slg",
      "<cmd>FzfLua live_grep_glob<CR>",
      noremap = true,
      desc = "Performant live grep in the project",
    },
  },
}
