return {
  {
    'vim-test/vim-test',
    event = { 'BufNewFile', 'BufReadPre', 'FileReadPre' },
    keys = {
      {
        '<leader>tf',
        '<cmd>TestFile<CR>',
        noremap = true,
        desc = 'vim-test the file',
      },
      {
        '<leader>tn',
        '<cmd>TestNearest<CR>',
        noremap = true,
        desc = 'vim-test the neareset spec',
      },
    },
  },
  {
    'antoinemadec/FixCursorHold.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-neotest/neotest-jest',
    'nvim-neotest/nvim-nio',
    'nvim-treesitter/nvim-treesitter',
    'olimorris/neotest-rspec',
    'zidhuss/neotest-minitest',
    'nvim-neotest/neotest-vim-test',
  },
  {
    'nvim-neotest/neotest',
    dependecies = {
      'antoinemadec/FixCursorHold.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-neotest/neotest-jest',
      'nvim-neotest/nvim-nio',
      'nvim-treesitter/nvim-treesitter',
      'olimorris/neotest-rspec',
      'zidhuss/neotest-minitest',
      'nvim-neotest/neotest-vim-test',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-rspec' {
            -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
            rspec_cmd = function()
              return vim.tbl_flatten {
                'bundle',
                'exec',
                'rspec',
              }
            end,
          },
          require 'neotest-jest',
          require 'neotest-minitest',
          require 'neotest-vim-test' { ignore_filetypes = { 'ruby', 'elixir' } },
        },
        output = {
          open_on_run = true,
          enter = true,
        },
      }
    end,
    keys = {
      {
        '<leader>tt',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run File',
      },
      {
        '<leader>tT',
        function()
          require('neotest').run.run(vim.uv.cwd())
        end,
        desc = 'Run All Test Files',
      },
      {
        '<leader>tr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run Nearest',
      },
      {
        '<leader>tl',
        function()
          require('neotest').run.run_last()
        end,
        desc = 'Run Last',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle Summary',
      },
      {
        '<leader>to',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = 'Show Output',
      },
      {
        '<leader>tO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle Output Panel',
      },
      {
        '<leader>tS',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Stop',
      },
      {
        '<leader>tw',
        function()
          require('neotest').watch.toggle(vim.fn.expand '%')
        end,
        desc = 'Toggle Watch',
      },
      {
        '<leader>ta',
        function()
          require('neotest').run.attach()
        end,
        desc = 'Attach to the nearest test',
      },
    },
  },
}
