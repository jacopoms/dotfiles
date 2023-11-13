return {
  {
    "nvim-neotest/neotest",
    dependecies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-plenary",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        "neotest-rspec",
        "neotest-plenary",
      },
      icons = {
        -- child_indent = "│",
        -- child_prefix = "├",
        -- collapsed = "─",
        -- expanded = "╮",
        -- failed = "✖",
        -- final_child_indent = " ",
        -- final_child_prefix = "╰",
        -- non_collapsible = "─",
        -- passed = "✔",
        running = "🗘",
        -- running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
        -- skipped = "ﰸ",
        -- unknown = "?",
      },
    },
    keys = {
      {
        "<leader>tw",
        function()
          require("neotest").watch(vim.fn.expand("%"))
        end,
        desc = "watch for changes",
      },
    },
  },
  {
    "vim-test/vim-test",
    lazy = true,
    event = { "BufNewFile", "BufReadPre", "FileReadPre" },
    keys = {
      {
        "<leader>tf",
        "<cmd>TestFile<CR>",
        noremap = true,
        desc = "vim-test the file",
      },
      {
        "<leader>tn",
        "<cmd>TestNearest<CR>",
        noremap = true,
        desc = "vim-test the neareset spec",
      },
    },
  },
}
