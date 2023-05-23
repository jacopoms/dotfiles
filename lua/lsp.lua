require("mason").setup()
require("mason-lspconfig").setup()
require("neodev").setup({
	library = { plugins = { "neotest" }, types = true },
})
local lsp_status = require("lsp-status")
lsp_status.register_progress()

local lspconfig = require("lspconfig")
local opts = { noremap = true, silent = true }
-- vim.diagnostic.get({ bufnr = nil })
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "d[", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "d]", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>ee", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<space>ld", "<cmd>Telescope diagnostics<CR>", opts)
vim.keymap.set("n", "<space>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)
vim.keymap.set("n", "<space>lw", "<cmd>Telescope lsp_workspace_symbols<CR>", opts)

-- vim.lsp.set_log_level("debug")

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	lsp_status.on_attach(client)

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<space>lgr", "<cmd>Telescope lsp_references<CR>", opts)
	vim.keymap.set("n", "<space>lgd", "<cmd>Telescope lsp_definitions<CR>", opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<space>lfm", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	-- for nvim 0.5.1
	-- local hl = "LspDiagnosticsSign" .. type
	-- for nvim 0.6.0
	local hl = "DiagnosticSign" .. type
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

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)

-- local eslint_config L require("lspconfig.server_configurations.eslint")

lspconfig.eslint.setup({
	-- cmd = { "yarn", "exec", unpack(eslint_config.default_config.cmd) }
})

lspconfig.elixirls.setup({
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
			fetchDeps = false,
		},
	},
})

lspconfig.solargraph.setup({
	cmd = { "solargraph", "stdio" },
	capabilities = capabilities,
	filetypes = { "ruby", "rakefile" },
	on_attach = on_attach,
	init_options = {
		formatting = true,
		diagnostic = true,
	},
	root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
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
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.lua.setup({
	capabilities = capabilities,
})

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
})
