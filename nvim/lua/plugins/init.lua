return {
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    keys = {
      { '<leader>dfo', '<cmd>DiffviewOpen<CR>', noremap = true },
      { '<leader>dff', '<cmd>DiffviewFileHistory %<CR>', noremap = true },
      { '<leader>dc', '<cmd>DiffviewClose<CR>', noremap = true },
    },
  },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' }, -- open file on github
  { 'machakann/vim-highlightedyank' },
  -- { "elixir-editors/vim-elixir" },
  { 'ryanoasis/vim-devicons' },
  {
    'numToStr/Comment.nvim',
    lazy = true,
    opts = {},
  },
  {
    'norcalli/nvim-colorizer.lua',
    lazy = false,
    opts = {},
  },
}
