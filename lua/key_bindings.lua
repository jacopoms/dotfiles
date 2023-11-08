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
-- bufferline

-- DiffView
-- vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { noremap = true })

-- update packages
vim.api.nvim_set_keymap("n", "<C-u><S-u>", "<cmd>Lazy sync<CR>", { noremap = true })

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
