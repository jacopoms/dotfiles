return {
  { "tpope/vim-rhubarb" }, -- open file on github
  -- { "machakann/vim-highlightedyank" },
  -- { "elixir-editors/vim-elixir" },
  { "ryanoasis/vim-devicons" },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    opts = {},
  },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "cappyzawa/trim.nvim",
    opts = {},
  },
  -- {
  --   "Pocco81/auto-save.nvim",
  -- },
}
