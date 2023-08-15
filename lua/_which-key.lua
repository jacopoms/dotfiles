local wk = require("which-key")

wk.register(wk.register({
	f = {
		name = "file", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
	},
}, { prefix = "<leader>" }))

wk.setup()
