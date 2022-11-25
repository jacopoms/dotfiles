local lspconfig = require("lspconfig")
local opts = { noremap = true, silent = true }
-- vim.diagnostic.get({ bufnr = nil })
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'd[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'd]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>ee', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<space>fd', '<cmd>Telescope diagnostics<CR>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>fm', function() vim.lsp.buf.format { async = true } end, bufopts)
end

vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)",
}

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  -- for nvim 0.5.1
  -- local hl = "LspDiagnosticsSign" .. type
  -- for nvim 0.6.0
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


vim.diagnostic.config({
  severity_sort = true,
  float = {
    source = "always", -- Or "if_many"
  },
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
})

local path_to_elixirls = vim.fn.expand("~/elixir-ls/release/language_server.sh")
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach
  }

  -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
  server:setup(opts)
  -- vim.cmd [[ do User LspAttachBuffers ]]
end)

local eslint_config = require("lspconfig.server_configurations.eslint")

lspconfig.eslint.setup {
  cmd = { "yarn", "exec", unpack(eslint_config.default_config.cmd) }
}

lspconfig.elixirls.setup {
  cmd = { path_to_elixirls },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = true,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
}

lspconfig.solargraph.setup {
  cmd = { 'solargraph', 'stdio' },
  capabilities = capabilities,
  filetypes = { "ruby", "rakefile" },
  on_attach = on_attach,
  init_options = {
    formatting = true,
    diagnostic = true
  },
  root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      commandPath = '~/.asdf/shims/solargraph',
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
      }
    }
  }
}

-- lsp_installer.on_server_ready(function (server) server:setup {} end)
