return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  -- stylua: ignore
  keys = {
    -- NOTE: <leader>gd and <leader>gD are taken by snacks_picker (git_diff hunks/origin)
    { "<leader>gv", "<cmd>DiffviewOpen<cr>",           desc = "Diff View (index)" },
    { "<leader>gV", "<cmd>DiffviewClose<cr>",          desc = "Diff View Close" },
    { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>",  desc = "File History (diffview)" },
  },
  opts = {},
}
