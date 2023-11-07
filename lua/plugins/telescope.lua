return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-github.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "LinArcX/telescope-env.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").load_extension("media_files")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("gh")
			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("env")

			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=auto",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--sort=path",
					},
					prompt_prefix = " ",
					selection_caret = " ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						height = 25,
						bottom_pane = {
							mirror = false,
							preview_width = 0.5,
							prompt_position = "top",
						},
						horizontal = {
							width = 0.90,
							height = 0.90,
							prompt_position = "top",
						},
					},
					file_sorter = require("telescope.sorters").get_fzy_sorter,
					file_ignore_patterns = {},
					generic_sorter = require("telescope.sorters").get_fzy_sorter,
					winblend = 0,
					border = true,
					borderchars = {
						prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
						results = { " " },
						preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					},
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					-- Developer configurations: Not meant for general override
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				},
				pickers = {
					-- find_files = {
					-- 	theme = "ivy",
					-- 	-- hidden = true
					-- },
					buffers = {
						show_all_buffers = true,
						sort_lastused = true,
						-- theme = "dropdown",
						-- previewer = false,
						mappings = {
							i = {
								["<c-d>"] = "delete_buffer",
							},
						},
					},
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					media_files = {
						filetypes = { "png", "webp", "jpg", "jpeg" },
						find_cmd = "rg", -- find command (defaults to `fd`)
					},
					file_browser = {
						theme = "ivy",
						mappings = {
							["i"] = {
								-- your custom insert mode mappings
							},
							["n"] = {
								-- your custom normal mode mappings
							},
						},
					},
				},
			})

			local M = {}

			local telescope_builtin = require("telescope.builtin")

			M.find_files = function()
				telescope_builtin.find_files({
					find_command = { "rg", "--files", "--iglob", "!.git", "--color auto", "--sort", "path" },
					previewer = true,
				})
			end

			M.diagnostics = function()
				telescope_builtin.diagnostics({
					bufnr = nil,
				})
			end

			local highlights = {
				TelescopeBorder = { default = true, link = "TelescopeNormal" },
				TelescopePromptBorder = { default = true, link = "TelescopeBorder" },
				TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
				TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },
			}

			for k, v in pairs(highlights) do
				vim.api.nvim_set_hl(0, k, v)
			end
		end,
		keys = {
			{ "<leader>fF", "<cmd>Telescope<CR>", noremap = true },
			{ "<leader>f", "<cmd>Telescope find_files prompt_prefix=🔍<CR>", noremap = true },
			{
				"<leader>fH",
				"<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files prompt_prefix=🔍🔍<CR>",
				noremap = true,
			},
			{ "<leader>fl", "<cmd>Telescope live_grep<CR>", noremap = true },
			{
				"<leader>fg",
				"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				noremap = true,
			},
			{
				"<leader>fi",
				"<cmd>lua require('telescope.builtin').live_grep({search_dirs={vim.fn.expand('%:p')}})<CR>",
				noremap = true,
			},
			{ "<leader>bb", "<cmd>Telescope buffers<CR>", noremap = true },
			{ "<leader>fb", "<cmd>Telescope file_browser<CR>", noremap = true },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", noremap = true },
			{ "<leader>fc", "<cmd>Telescope commands<CR>", noremap = true },
			{ "<leader>fq", "<cmd>Telescope quickfix<CR>", noremap = true },
			{ "<leader>ft", "<cmd>Telescope tags<CR>", noremap = true },
			{ "<leader>fa", "<cmd>Telescope grep_string<CR>", noremap = true },
			{ "<leader>fe", "<cmd>Telescope env<CR>", noremap = true },
			{ "<leader>gf", "<cmd>Telescope git_files<CR>", noremap = true },
			{ "<leader>g", "<cmd>Telescope git_status<CR>", noremap = true },
			{ "<leader>gs", "<cmd>Telescope git_stash<CR>", noremap = true },
			{ "<leader>gl", "<cmd>Telescope git_commits<CR>", noremap = true },
			{ "<leader>glb", "<cmd>Telescope git_bcommits<CR>", noremap = true },
			{ "<leader>gb", "<cmd>Telescope git_branches<CR>", noremap = true },
			{ "<leader>gpr", "<cmd>Telescope gh pull_request<CR>", noremap = true },
		},
	},
}
