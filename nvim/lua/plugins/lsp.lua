return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      float = {
        source = "always", -- Or "if_many"
      },
      update_in_insert = true,
      virtual_text = false,
    },
  },
}
