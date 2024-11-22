-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Swap horizontally splits
vim.keymap.set("n", "<C-w><S-h>", ":windo wincmd H<CR>", { noremap = true })

-- Swap vertically splits
vim.keymap.set("n", "<C-w><S-k>", ":windo wincmd K<CR>", { noremap = true })

-- remap escape jk
vim.keymap.set("i", "<Esc>+j", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>+j", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<Esc>+k", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>+k", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("t", "<C-j><C-k>", "<C-\\><C-N>", { noremap = true })
-- vim.keymap.del("i", "<A-j>")
-- vim.keymap.del("i", "<A-k>")
-- vim.keymap.del("n", "<A-j>")
-- vim.keymap.del("n", "<A-k>")
-- vim.keymap.del("v", "<A-j>")
-- vim.keymap.del("v", "<A-k>")
-- vim.keymap.set("i", "<A-n>", "<esc><cmd>m .+1<cr>==gi", { noremap = true, desc = "Move Down" })
-- vim.keymap.set("i", "<A-p>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- vim.keymap.set("n", "<A-n>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
-- vim.keymap.set("n", "<A-p>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
-- vim.keymap.set("v", "<A-n>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
-- vim.keymap.set("v", "<A-p>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
