return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      float = {
        source = "always", -- Or "if_many"
      },
      update_in_insert = true,
      virtual_text = false,
      -- virtual_lines = {
      --   current_line = true,
      -- },
    },
    servers = {
      solargraph = {
        mason = false,
        cmd = { "bundle", "exec", "solargraph", "stdio" },
      },
      rubocop = {
        mason = false,
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
      },
    },
  },
}
