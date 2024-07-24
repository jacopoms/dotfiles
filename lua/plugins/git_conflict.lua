return {
  {
    "akinsho/git-conflict.nvim",
    lazy = true,
    event = { "BufNewFile", "BufReadPre", "FileReadPre" },
    version = "*",
    config = true,
  },
}
