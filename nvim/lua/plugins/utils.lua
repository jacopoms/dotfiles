return {
  { "nvim-tree/nvim-web-devicons" },
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
    "cappyzawa/trim.nvim",
    opts = {},
  },
  {
    "kosayoda/nvim-lightbulb",
    opts = {
      autocmd = { enabled = true },
    },
  },
  {
    "amrbashir/nvim-docs-view",
    lazy = true,
    cmd = "DocsViewToggle",
    opts = {
      position = "right",
      width = 60,
    },
    keys = {
      {
        "<leader>cg",
        "<cmd>DocsViewToggle<CR>",
        noremap = true,
        desc = "Toggle docs view sidebar",
      },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      restricted_keys = {
        ["h"] = { "x" },
        ["j"] = { "x" },
        ["k"] = { "x" },
        ["l"] = { "x" },
      },
    },
  },
}
