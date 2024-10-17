return {
  "mfussenegger/nvim-lint",
  opts = {
    -- Event to trigger linters
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      ruby = { "rubocop", "ruby" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      markdown = { "markdownlint" },
      --   -- dynamically enable/disable linters based on the context.
      -- Use the "*" filetype to run linters on all filetypes.
      -- ["*"] = { "global linter" },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    },
  },
}
