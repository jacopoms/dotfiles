-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Swap horizontally splits
vim.keymap.set("n", "<C-w><S-h>", ":windo wincmd H<CR>", { noremap = true })
-- Swap vertically splits
vim.keymap.set("n", "<C-w><S-k>", ":windo wincmd K<CR>", { noremap = true })

vim.keymap.set("n", "qp", "<Esc>", { noremap = true })
vim.keymap.set("i", "qp", "<Esc>", { noremap = true })
vim.keymap.set("t", "<C-j><C-k>", "<C-\\><C-N>", { noremap = true })
