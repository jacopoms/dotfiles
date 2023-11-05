require("core")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("lsp")
require("buffer")
-- require("_lualine")
require("evil_lualine")
require("telescope-nvim")
require("_hover")
require("_neogen")
require("_neotest")
require("_todo_comments")
require("_which-key")

require("key_bindings")
