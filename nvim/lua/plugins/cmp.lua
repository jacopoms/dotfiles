return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "lukas-reineke/cmp-rg",
  },
  opts = function(_, opts)
    table.insert(opts.sources, {
      {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "nvim_lsp_document_symbol" },
        { name = "nvim_lsp_signature_help" },
      },
      {
        { name = "path" },
        { name = "rg" },
        { name = "buffer" },
        { name = "emoji" },
      },
    })
  end,
}
