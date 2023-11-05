-- let mapleader = " "
vim.api.nvim_set_keymap("t", "<leader><Esc>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-T>", "<cmd>vnew term://zsh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-X>", "<Cmd>split term://zsh<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Saving keystrokes when moving between splits
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w><C-j>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w><C-k>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w><C-l>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w><C-h>", { silent = true })

-- split vertically
vim.api.nvim_set_keymap("n", "<C-s><C-v>", "<cmd>vsp<CR>", { noremap = true })
-- split horizontally
vim.api.nvim_set_keymap("n", "<C-s><C-h>", "<cmd>sp<CR>", { noremap = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>fF", "<cmd>Telescope<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Telescope find_files prompt_prefix=🔍<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fH",
	"<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files prompt_prefix=🔍🔍<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fi",
	"<cmd>lua require('telescope.builtin').live_grep({search_dirs={vim.fn.expand('%:p')}})<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope commands<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fa", "<cmd>Telescope grep_string<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fe", "<cmd>Telescope env<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Telescope git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>Telescope git_status<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_stash<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>Telescope git_commits<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>glb", "<cmd>Telescope git_bcommits<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gpr", "<cmd>Telescope gh pull_request<CR>", { noremap = true })

-- bufferline
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>bdelete<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>Q", "<cmd>bdelete!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true })

-- DiffView
-- vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dff", "<cmd>DiffviewFileHistory %<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { noremap = true })

-- update packages
vim.api.nvim_set_keymap("n", "<C-u><S-u>", "<cmd>Lazy sync<CR>", { noremap = true })

-- format code
vim.api.nvim_set_keymap("n", "<leader>f=", "<cmd>Format<CR>", { noremap = true })

-- Gitsigns
vim.api.nvim_set_keymap("n", "<leader>hn", "<cmd>lua require('gitsigns').next_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hp", "<cmd>lua require('gitsigns').prev_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hR", "<cmd>lua require('gitsigns').reset_buffer()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hb", "<cmd>lua require('gitsigns').blame_line(true)<CR>", { noremap = true })

-- vim test
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>:TestFile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>:TestNearest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>:TestSuite<CR>", { noremap = true })
vim.cmd([[
  let test#strategy = "neovim"
  let test#ruby#use_binstubs = 0
  let test#ruby#rspec#executable = "bundle exec rspec"
]])

-- close search
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", { noremap = true })

-- Copy and save from the clipboard
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>Y", '"+y$', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>yy", '"+yy', { noremap = true })

-- Paste from clipboard
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>P", '"+P', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>P", '"+P', { noremap = true })

-- SymbolsOutline plugin
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>SymbolsOutline<CR>", { noremap = true })

-- Swap horizontally splits
vim.api.nvim_set_keymap("n", "<C-w><S-h>", ":windo wincmd H<CR>", { noremap = true })

-- Swap vertically splits
vim.api.nvim_set_keymap("n", "<C-w><S-k>", ":windo wincmd K<CR>", { noremap = true })

-- Substitute the word under the cursor
vim.api.nvim_set_keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>//", { noremap = true })

-- Search forward for word under the cursor
vim.api.nvim_set_keymap("n", "<leader>h", "/<C-r><C-w><CR>", { noremap = true })

-- Search backward for word under the cursor
vim.api.nvim_set_keymap("n", "<leader>hh", "?<C-r><C-w><CR>", { noremap = true })

-- Save with leader W
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true })

-- Remap Ctrl-q in insert mode to Esc
vim.api.nvim_set_keymap("i", "<C-q>", "<Esc>", { noremap = true })

