return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "zbirenbaum/copilot-cmp",
  },
  opts = function(_, opts)
    table.insert(opts.sources, {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "nvim_lsp_document_symbol" },
      { name = "nvim_lsp_signature_help" },
    })
    -- table.insert(opts.sources, 1, {
    --     name = "copilot",
    --     group_index = 1,
    --     priority = 100,
    --   })
  end,
}
