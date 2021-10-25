local lspconfig = require("lspconfig")
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

local path_to_elixirls = vim.fn.expand("~/elixir-ls/release/language_server.sh")

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local opts = {}

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end
  if server.name == "solargraph" then
    opts = {
      cmd = { "solargraph", "stdio" },
      on_attach = on_attach,
      settings = {
        solargraph = {
          useBundler = true,
          bundlerPath = "~/.asdf/shims/bundle",
          transport = "stdio",
          autoformat = true,
          logLevel = "debug",
          diagnostics = true,
          completion = true,
          symbols = true,
          references = true,
          definitions = true,
          formatting = true,
          hover = true,
          flags = {
            debounce_text_changes = 150,
          }
        }
      }
    }
  elseif server.name == "elixirls" then
    opts = {
      cmd = { path_to_elixirls },
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        elixirLS = {
          -- I choose to disable dialyzer for personal reasons, but
          -- I would suggest you also disable it unless you are well
          -- aquainted with dialzyer and know how to use it.
          dialyzerEnabled = false,
          -- I also choose to turn off the auto dep fetching feature.
          -- It often get's into a weird state that requires deleting
          -- the .elixir_ls directory and restarting your editor.
          fetchDeps = false
        }
      }
    }
  elseif server.name == "efm" then
    opts = {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "elixir",
      }
    }
  else
    opts = {}
  end
  -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

-- lsp_installer.on_server_ready(function (server) server:setup {} end)

