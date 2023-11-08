vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set clipboard+=unnamedplus
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.linespace = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
-- set number relativenumber
vim.opt.number = true

vim.opt.ruler = true
vim.opt.hidden = true
vim.opt.textwidth = 100
vim.opt.colorcolumn = "100"
vim.opt.spelllang = "en"
-- set noswapfile
vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir")
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
vim.opt.foldlevel = 1
vim.opt.title = true
-- set nohlsearch
vim.opt.scrolloff = 8
vim.opt.shortmess = vim.o.shortmess .. "c"
vim.opt.cursorline = true
vim.opt.inccommand = "nosplit"
vim.opt.fillchars = "vert:│"
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 10
vim.opt.laststatus = 3
-- set list listchars=tab:»\ ,trail:·,eol:¬,extends:>,precedes:<,nbsp:+

-- Vim ruby
-- set nocompatible      " We're running Vim, not Vi!
vim.cmd("filetype on") -- Enable filetype detection
vim.cmd("filetype indent on") -- Enable filetype-specific indenting
vim.cmd("filetype plugin on") -- Enable filetype-specific plugins

-- auto cmds
vim.cmd([[
  augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]])

vim.cmd([[
  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
  augroup END
]])

vim.cmd([[
augroup dirchange
  autocmd!
  autocmd DirChanged * let &titlestring=v:event['cwd']
augroup END
]])

vim.cmd("autocmd TermOpen * setlocal nonu")
vim.cmd(
	"autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby"
)
vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = true})")
-- vim.cmd("autocmd BufWritePre * :normal gg=G")
-- remaps
-- indent
vim.cmd("setlocal autoindent")
vim.cmd("setlocal smartindent")
vim.cmd("setlocal expandtab")
vim.cmd("setlocal shiftwidth=2")
vim.cmd("setlocal tabstop=2")
vim.cmd("setlocal softtabstop=2")
vim.cmd("setlocal softtabstop=2")

vim.cmd([[set termguicolors]])
-- vim.cmd([[colorscheme  spaceduck]])
vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#778899]])
