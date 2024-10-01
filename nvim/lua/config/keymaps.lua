-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Swap horizontally splits
vim.keymap.set("n", "<C-w><S-h>", ":windo wincmd H<CR>", { noremap = true })

-- Swap vertically splits
vim.keymap.set("n", "<C-w><S-k>", ":windo wincmd K<CR>", { noremap = true })

-- remap escape qq
vim.keymap.del("i", "<ESC>")
vim.keymap.set("i", "qq", "<ESC>", { noremap = true })
-- vim.keymap.set("n", "qq", "<ESC>", { noremap = true })
-- vim.keymap.set("v", "qq", "<ESC>", { noremap = true })
-- vim.keymap.set("x", "qq", "<ESC>", { noremap = true })
-- vim.keymap.set("l", "qq", "<ESC>", { noremap = true })
-- vim.keymap.set("s", "qq", "<ESC>", { noremap = true })
-- vim.keymap.set("c", "qq", "<ESC>", { noremap = true })
-- vim.keymap.set("t", "qq", "<ESC>", { noremap = true })
