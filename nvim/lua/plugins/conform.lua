return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      handlebars = { "prettier" },
      ruby = { "rubocop", "solargraph" },
    },
    formatters = {
      rubocop = {
        args = { "--server", "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
      },
    },
  },
}
