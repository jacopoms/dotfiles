return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	dependencies = { "zbirenbaum/copilot-cmp" },
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = false,
			},
			panel = {
				enabled = false,
			},
			copilot_node_command = "/Users/jghisolfi/.asdf/shims/node",
		})
	end,
}
