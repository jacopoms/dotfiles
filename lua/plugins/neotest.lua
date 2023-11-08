vim.cmd([[
  command! NeotestSummary lua require("neotest").summary.toggle()
  command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%"))
  command! Neotest lua require("neotest").run.run(vim.fn.getcwd())
  command! NeotestNearest lua require("neotest").run.run()
  command! NeotestAttach lua require("neotest").run.attach()
  command! NeotestWatch lua require("neotest").watch.watch(vim.fn.getcwd())
  command! NeotestWatchFile lua require("neotest").watch.watch(vim.fn.expand("%"))
  command! NeotestWatchToggleFile lua require("neotest").watch.toggle(vim.fn.expand("%"))
  command! NeotestOutput lua require("neotest").output.open()
  command! NeotestOutputPanel lua require("neotest").output_panel.toggle()
  command! NeotestJumpNext lua require("neotest").jump.next({ status = "failed" })
  command! NeotestJumpPrev lua require("neotest").jump.prev({ status = "failed" })
]])

return {
	"nvim-neotest/neotest",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"olimorris/neotest-rspec",
		"nvim-neotest/neotest-vim-test",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-rspec"),
			},
			benchmark = {
				enabled = true,
			},
			icons = {
				child_indent = "│",
				child_prefix = "├",
				collapsed = "─",
				expanded = "╮",
				failed = "✖",
				final_child_indent = " ",
				final_child_prefix = "╰",
				non_collapsible = "─",
				passed = "✔",
				running = "🗘",
				running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
				skipped = "ﰸ",
				unknown = "?",
			},
		})
	end,
	-- require("neotest-vim-test")({ ignore_filetypes = { "ruby" } }),
	keys = {

		{ "<leader>ntn", ":NeotestNearest<CR>", mode = "n" },
		-- -- -- run all file
		{ "<leader>nt", ":NeotestFile<CR>", mode = "n" },
		-- -- -- run all suite
		{ "<leader>ntt", ":Neotest<CR>", mode = "n" },
		-- attach float window
		{ "<leader>nta", ":NeotestAttach<CR>", mode = "n" },
		-- watch file
		{ "<leader>ntw", ":NeotestWatchFile<CR>", mode = "n" },
		-- watch suite
		{ "<leader>ntww", ":NeotestWatch<CR>", mode = "n" },
		-- toggle watch file
		{ "<leader>ntwt", ":NeotestWatchToggleFile<CR>", mode = "n" },
		-- -- -- open summary
		{ "<leader>nts", ":NeotestSummary<CR>", mode = "n" },
		-- open output
		{ "<leader>nto", ":NeotestOutput<CR>", mode = "n" },
		-- open output panel
		{ "<leader>ntp", ":NeotestOutputPanel<CR>", mode = "n" },
		-- jump next failed
		{ "[n", ":NeotestJumpNext<CR>", mode = "n" },
		-- jump prev failed
		{ "]n", ":NeotestJumpPrev<CR>", mode = "n" },
	},
}
