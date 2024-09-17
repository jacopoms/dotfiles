return {
  'danymat/neogen',
  lazy = true,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'L3MON4D3/LuaSnip',
  },
  config = function()
    require('neogen').setup {
      enabled = true,
      snippet_engine = 'luasnip',
      languages = {
        ['ruby.yard'] = require 'neogen.configurations.ruby',
        ['ruby.rdoc'] = require 'neogen.configurations.ruby',
      },
    }
  end,
  -- Uncomment next line if you want to follow only stable versions
  version = '*',
  keys = {
    {
      '<space>nf',
      function()
        require('neogen').generate()
      end,
      noremap = true,
      silent = true,
    },
  },
}
