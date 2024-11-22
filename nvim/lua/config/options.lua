-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.textwidth = 100
opt.colorcolumn = "100"
opt.ruler = true
opt.hidden = true
opt.incsearch = true
opt.title = true

-- ater/ftplugin/typescript.vim
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 3000
opt.timeoutlen = 100
