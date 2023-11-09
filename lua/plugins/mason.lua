return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "rubocop",
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
    automatic_installation = false,
  },
}
