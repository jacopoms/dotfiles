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
    "antoinemadec/FixCursorHold.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
    "zidhuss/neotest-minitest",
  },
  {
    "nvim-neotest/neotest",
    dependecies = {
      "antoinemadec/FixCursorHold.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
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
      },
      output = {
        open_on_run = true,
        enter = true,
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
