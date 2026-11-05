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
    servers = {
      solargraph = {
        mason = false,
        cmd = { "bundle", "exec", "solargraph", "stdio" },
      },
      rubocop = {
        mason = false,
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
      },
      ruby_lsp = {
        mason = false,
        cmd = function(dispatchers, config)
          local cmd = { "ruby-lsp" }
          local root = config.root_dir
          if root and vim.uv.fs_stat(root .. "/Gemfile") and vim.fn.executable("bundle") == 1 then
            cmd = { "bundle", "exec", "ruby-lsp" }
          end
          return vim.lsp.rpc.start(
            cmd,
            dispatchers,
            config and config.root_dir and { cwd = config.cmd_cwd or config.root_dir }
          )
        end,
      },
      eslint = {
        mason = false,
        settings = {
          workingDirectories = { mode = "auto" },
        },
      },
      copilot = {
        enabled = true,
        mason = false,
      },
      -- LazyVim's vtsls extra sets autoUseWorkspaceTsdk = true; do not pin tsserver.path to
      -- vim.fn.getcwd() — that breaks when Neovim's cwd differs from the package.json root.
      vtsls = {
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
          },
        },
      },
    },
  },
}
