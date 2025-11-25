return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-treesitter/nvim-treesitter-context" },
  keys = {
    {
      "<leader>slg",
      "<cmd>FzfLua live_grep_glob<CR>",
      noremap = true,
      desc = "Performant live grep in the project",
    },
  },
}
