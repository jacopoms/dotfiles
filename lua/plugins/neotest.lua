return {
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "nvim-neotest/neotest-vim-test",
    dependecies = {
      "nvim-neotest/nvim-nio",
    },
  },
  {
    "zidhuss/neotest-minitest",
  },
  {
    "nvim-neotest/neotest-jest",
  },
  {
    "vim-test/vim-test",
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
  {
    "nvim-neotest/neotest",
    dependecies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      "vim-test/vim-test/",
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-vim-test",
      "zidhuss/neotest-minitest",
      "nvim-neotest/neotest-jest",
    },
    opts = {
      adapters = {
        "neotest-rspec",
        "neotest-jest",
        "neotest-minitest",
        require("neotest-vim-test")({ ignore_filetypes = { "ruby", "javascript", "typescript" } }),
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
      {
        "<leader>ta",
        function()
          require("neotest").run.attach()
        end,
        desc = "Attach to the nearest test",
      },
    },
  },
}
