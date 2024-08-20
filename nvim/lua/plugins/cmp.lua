return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-emoji",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    opts.sources = {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "luasnip" },
      { name = "emoji" },
      { name = "buffer" },
    }
  end,
}
