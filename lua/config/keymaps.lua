-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Search forward for word under the cursor
vim.api.nvim_set_keymap("n", "<leader>h", "/<C-r><C-w><CR>", { noremap = true })
-- Search backward for word under the cursor
vim.api.nvim_set_keymap("n", "<leader>hh", "?<C-r><C-w><CR>", { noremap = true })
