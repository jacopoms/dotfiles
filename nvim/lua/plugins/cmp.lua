return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "lukas-reineke/cmp-rg",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "rg" },
      { name = "path" },
      { name = "luasnip" },
      { name = "emoji" },
      { name = "nvim_lsp_document_symbol" },
      { name = "nvim_lsp_signature_help" },
      { name = "buffer" },
    })
  end,
}
