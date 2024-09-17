local utils = require 'config.utils'
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
utils.map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keyutils.mapkjjjjs
utils.map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own utils.mapping
-- or just use <C-\><C-n> to exit terminal mode
utils.map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- utils.map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- utils.map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- utils.map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- utils.map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
utils.map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
utils.map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
utils.map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
utils.map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move Lines
utils.map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
utils.map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
utils.map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
utils.map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
utils.map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
utils.map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- buffers
utils.map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
utils.map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
utils.map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
utils.map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
utils.map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
utils.map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
utils.map('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete Buffer' })
utils.map('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })
-- save file
utils.map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

--keywordprg
utils.map('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })

-- better indenting
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')

-- commenting
utils.map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
utils.map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })
-- quit
utils.map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- terminal
utils.map('n', '<c-/>', '<cmd>terminal<cr>', { desc = 'Terminal (Root Dir)' })
-- lazy
utils.map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
-- Swap horizontally splits
utils.map('n', '<C-w><S-h>', ':windo wincmd H<CR>', { noremap = true })

-- Swap vertically splits
utils.map('n', '<C-w><S-k>', ':windo wincmd K<CR>', { noremap = true })
