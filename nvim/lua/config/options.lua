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

opt.mousemoveevent = true

-- opt.foldmethod = "syntax"
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- completion
opt.completeopt = "menuone,noselect,noinsert"
opt.pumheight = 10

-- column
opt.number = true
opt.signcolumn = "yes"

-- timings
opt.updatetime = 200
opt.timeoutlen = 300

-- editor
opt.virtualedit = "block"
opt.formatoptions = "jcroqlnt"
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2

-- folds
opt.fillchars = {
  diff = "╱",
  fold = " ",
  foldclose = "",
  foldopen = "",
  eob = " ",
}
-- Nice and simple folding:
opt.foldenable = true

opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.foldcolumn = "0"
opt.fillchars:append({ fold = " " })
-- undo
opt.undofile = true
opt.undolevels = 10000

-- mouse
opt.mouse = "a"

-- Show whitespace.
opt.list = true
opt.listchars = { tab = "  ↦" }

-- Status line.
opt.laststatus = 3
opt.cmdheight = 1

-- split
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- messages
opt.shortmess:append({
  w = true,
  s = true,
  I = true,
})

-- Git diff
opt.diffopt:append({ "vertical,context:100,linematch:100" })

-- cursor
opt.cursorline = true

-- GUI!?
opt.termguicolors = true

-- spell
opt.spelllang = { "en" }
opt.spelloptions:append("noplainbuffer")

-- search
opt.ignorecase = true
opt.smartcase = true

-- Markdown indentation
vim.g.markdown_recommended_style = 0

-- Ruby
vim.g.lazyvim_ruby_lsp = "solargraph"
