require("neogen").setup({
	enabled = true,
	snippet_engine = "luasnip",
	languages = {
		["ruby.yard"] = require("neogen.configurations.ruby"),
		["ruby.rdoc"] = require("neogen.configurations.ruby"),
	},
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>nf", ":lua require('neogen').generate()<CR>", opts)
