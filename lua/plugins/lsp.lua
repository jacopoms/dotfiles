return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = true,
      severity_sort = true,
      virtual_text = false,
      float = {
        source = "always", -- Or "if_many"
      },
      signs = true,
    },
    servers = {
      solargraph = {
        mason = false,
        cmd = { "solargraph", "stdio" },
        filetypes = { "ruby", "rakefile" },
        init_options = {
          formatting = true,
          diagnostic = true,
        },
        -- root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
        settings = {
          solargraph = {
            commandPath = "~/.asdf/shims/solargraph",
            autoformat = true,
            completion = true,
            diagnostic = true,
            formatting = true,
            folding = true,
            references = true,
            rename = true,
            symbols = true,
            flags = {
              debounce_text_changes = 150,
            },
          },
        },
      },
      ruby_ls = {
        mason = false,
        cmd = { "ruby-lsp" },
        formatter = "auto",
      },
    },
  },
}
