return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "lua-language-server",
      "shellcheck",
      "shfmt",
      "flake8",
      "eslint-lsp",
      "vtsls",
    },
    automatic_installation = {
      true,
    },
  },
}
