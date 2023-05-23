local neotest = require("neotest")
neotest.setup({
	adapters = {
		require("neotest-rspec")({
			rspec_cmd = function()
				return vim.tbl_flatten({
					"bundle",
					"exec",
					"rspec",
				})
			end,
		}),
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
	require("neotest-vim-test")({ ignore_filetypes = { "ruby" } }),
})

local opts = { noremap = true, silent = true }

vim.cmd([[
  command! NeotestSummary lua require("neotest").summary.toggle()
  command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%"))
  command! Neotest lua require("neotest").run.run(vim.fn.getcwd())
  command! NeotestNearest lua require("neotest").run.run()
  command! NeotestAttach lua require("neotest").run.attach()
  command! NeotestOutput lua require("neotest").output.open()
  command! NeotestOutputPanel lua require("neotest").output_panel.toggle()
  command! NeotestJumpNext lua require("neotest").jump.next({ status = "failed" })
  command! NeotestJumpPrev lua require("neotest").jump.prev({ status = "failed" })
]])

-- -- run nearest spec
vim.keymap.set("n", "<space>ntn", ":NeotestNearest<CR>", opts)
-- -- -- run all file
vim.keymap.set("n", "<space>nt", ":NeotestFile<CR>", opts)
-- -- -- run all suite
vim.keymap.set("n", "<space>ntt", ":Neotest<CR>", opts)
-- attach float window
vim.keymap.set("n", "<space>nta", ":NeotestAttach<CR>", opts)
-- -- -- open summary
vim.keymap.set("n", "<space>nts", ":NeotestSummary<CR>", opts)
-- open output
vim.keymap.set("n", "<space>nto", ":NeotestOutput<CR>", opts)
-- open output panel
vim.keymap.set("n", "<space>ntp", ":NeotestOutputPanel<CR>", opts)
-- jump next failed
vim.keymap.set("n", "[n", ":NeotestJumpNext<CR>", opts)
-- jump prev failed
vim.keymap.set("n", "]n", ":NeotestJumpPrev<CR>", opts)
