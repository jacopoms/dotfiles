return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>t"] = { name = "+test" },
      },
    },
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
  -- {
  --   "antoinemadec/FixCursorHold.nvim",
  --   "nvim-lua/plenary.nvim",
  --   "nvim-neotest/neotest-jest",
  --   "nvim-neotest/nvim-nio",
  --   "nvim-treesitter/nvim-treesitter",
  --   "olimorris/neotest-rspec",
  --   "vim-test/vim-test/",
  --   "zidhuss/neotest-minitest",
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   dependecies = {
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-neotest/neotest-jest",
  --     "nvim-neotest/nvim-nio",
  --     "nvim-treesitter/nvim-treesitter",
  --     "olimorris/neotest-rspec",
  --     "vim-test/vim-test/",
  --     "zidhuss/neotest-minitest",
  --   },
  --   opts = {
  --     adapters = {
  --       ["neotest-rspec"] = {
  --         -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
  --         rspec_cmd = function()
  --           return vim.tbl_flatten({
  --             "bundle",
  --             "exec",
  --             "rspec",
  --           })
  --         end,
  --       },
  --       "neotest-jest",
  --       "neotest-minitest",
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>tw",
  --       function()
  --         require("neotest").watch(vim.fn.expand("%"))
  --       end,
  --       desc = "watch for changes",
  --     },
  --     {
  --       "<leader>ta",
  --       function()
  --         require("neotest").run.attach()
  --       end,
  --       desc = "Attach to the nearest test",
  --     },
  --     {
  --       "<leader>tt",
  --       function()
  --         require("neotest").run.run(vim.fn.expand("%"))
  --       end,
  --       desc = "Run File",
  --     },
  --     {
  --       "<leader>tT",
  --       function()
  --         require("neotest").run.run(vim.loop.cwd())
  --       end,
  --       desc = "Run All Test Files",
  --     },
  --     {
  --       "<leader>tr",
  --       function()
  --         require("neotest").run.run()
  --       end,
  --       desc = "Run Nearest",
  --     },
  --     {
  --       "<leader>tl",
  --       function()
  --         require("neotest").run.run_last()
  --       end,
  --       desc = "Run Last",
  --     },
  --     {
  --       "<leader>ts",
  --       function()
  --         require("neotest").summary.toggle()
  --       end,
  --       desc = "Toggle Summary",
  --     },
  --     {
  --       "<leader>to",
  --       function()
  --         require("neotest").output.open({ enter = true, auto_close = true })
  --       end,
  --       desc = "Show Output",
  --     },
  --     {
  --       "<leader>tO",
  --       function()
  --         require("neotest").output_panel.toggle()
  --       end,
  --       desc = "Toggle Output Panel",
  --     },
  --     {
  --       "<leader>tS",
  --       function()
  --         require("neotest").run.stop()
  --       end,
  --       desc = "Stop",
  --     },
  --   },
  -- },
}
