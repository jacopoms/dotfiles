return {
  -- Ruby plugins
  { import = "lazyvim.plugins.extras.lang.ruby" },
  { "RRethy/nvim-treesitter-endwise" },
  {
    "vim-ruby/vim-ruby",
    lazy = true,
    ft = { "ruby" },
  },
  {
    "kchmck/vim-coffee-script",
    lazy = true,
    ft = { "ruby" },
  },
  {
    "jlcrochet/vim-rbs",
    lazy = true,
    ft = { "ruby" },
  },
}
