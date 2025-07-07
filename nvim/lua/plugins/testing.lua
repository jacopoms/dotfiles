return {
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
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
    "zidhuss/neotest-minitest",
    "jfpedroza/neotest-elixir",
    "antoinemadec/FixCursorHold.nvim",
  },
  {
    "nvim-neotest/neotest",
    dependecies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
      "jfpedroza/neotest-elixir",
      "antoinemadec/FixCursorHold.nvim",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
          rspec_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rspec",
            })
          end,
        },
        "neotest-jest",
        "neotest-minitest",
        "neotest-elixir",
      },
      output = {
        open_on_run = true,
        enter = true,
      },
      diagnostic = {
        enabled = true,
      },
      log_level = vim.log.levels.TRACE,
    },
    keys = {
      {
        "<leader>twf",
        function()
          require("neotest").watch.toggle({ vim.fn.expand("%") })
        end,
        desc = "Neotest: watch for file changes",
      },
      {
        "<LocalLeader>twn",
        function()
          require("neotest").watch.toggle()
        end,
        desc = "Neotest: Watch nearest test",
      },
      {
        "<LocalLeader>twa",
        function()
          require("neotest").watch.stop()
        end,
        desc = "Neotest: Stop watching",
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
