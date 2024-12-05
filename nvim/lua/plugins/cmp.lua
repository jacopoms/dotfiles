return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "zbirenbaum/copilot-cmp",
    "tzachar/fuzzy.nvim",
    "tzachar/cmp-fuzzy-buffer",
  },
  opts = function(_, opts)
    table.insert(opts.sources, {
      { name = "copilot", group_index = 2 },
      { name = "fuzzy_buffer", group_index = 2 },
      { name = "nvim_lsp", group_index = 2 },
      { name = "nvim_lsp_signature_help", group_index = 1 },
    })
  end,
}
