return {
  {
    "nvim-neotest/neotest-jest",
  },
  {
    "nvim-neotest/neotest",
    ft = { "ruby", "typescript", "javascript" },
    dependecies = {
      "nvim-neotest/neotest-jest",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-plenary",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        "neotest-rspec",
        "neotest-plenary",
        require("neotest-jest"),
      },
      icons = {
        running = "🗘",
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
