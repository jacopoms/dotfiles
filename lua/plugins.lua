return require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"}
    }
  }
  use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
  }
  use "hrsh7th/nvim-compe"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  use {
    "akinsho/nvim-bufferline.lua",
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
  -- use "glepnir/lspsaga.nvim"
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb" -- open file on github
  use "fnune/base16-vim"
  use "tpope/vim-endwise"
  use "ryanoasis/vim-devicons"
  use "machakann/vim-highlightedyank"
  use "vim-ruby/vim-ruby"
  use "navarasu/onedark.nvim"
  use "glepnir/spaceline.vim"
  -- use {
  --   "hoob3rt/lualine.nvim",
  --   requires = {'kyazdani42/nvim-web-devicons'},
  --   config = function() require('lualine').setup({
  --     options = {
  --       theme = 'onedark'
  --     }
  --   }) end
  -- }
  use "terrortylor/nvim-comment"
  use "vim-test/vim-test"
  use "ntpeters/vim-better-whitespace"
  use "airblade/vim-gitgutter"
  use {
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim"}
  }
end)
