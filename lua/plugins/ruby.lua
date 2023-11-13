return {
  -- Ruby plugins
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
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "olimorris/neotest-rspec",
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
      },
    },
  },
}
