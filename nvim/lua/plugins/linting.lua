return {
  "mfussenegger/nvim-lint",
  opts = {
    -- Event to trigger linters
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      fish = { "fish" },
      ruby = { "rubocop", "ruby" },
      --   -- dynamically enable/disable linters based on the context.
      -- Use the "*" filetype to run linters on all filetypes.
      -- ["*"] = { "global linter" },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    },
    -- LazyVim extension to easily override linter options
    -- or add custom linters.
    ---@type table<string,table>
    linters = {},
  },
}
