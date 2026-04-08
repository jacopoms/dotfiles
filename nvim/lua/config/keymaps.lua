-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>s*",
  ":%s/\\<<C-r><C-w>\\>//g<Left><Left>",
  { desc = "Substitute word under cursor (buffer)" }
)

-- <C-a> is captured by tmux (prefix key), remap increment to <C-q>
vim.keymap.set({ "n", "v" }, "<C-q>", "<C-a>", { noremap = true, desc = "Increment" })

-- Swap horizontally splits
vim.keymap.set("n", "<C-w><S-h>", ":windo wincmd H<CR>", { noremap = true })
-- Swap vertically splits
vim.keymap.set("n", "<C-w><S-k>", ":windo wincmd K<CR>", { noremap = true })

vim.keymap.set("n", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("t", "jk", "<Esc>", { noremap = true })
vim.keymap.set("t", "<C-j><C-k>", "<C-\\><C-N>", { noremap = true })
