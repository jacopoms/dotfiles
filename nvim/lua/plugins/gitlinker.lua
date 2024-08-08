return {

	"ruifm/gitlinker.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function ()
		require("gitlinker").setup()

	end
}

-- vim.api.nvim_set_keymap('n', '<space>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>', {silent = true})
-- vim.api.nvim_set_keymap('n', '<space>gB', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
--
