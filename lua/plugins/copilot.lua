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
			copilot_node_command = "/Users/jacopo/.asdf/installs/nodejs/20.5.0/bin/node",
		})
	end,
}

