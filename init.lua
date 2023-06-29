if vim.g.vscode then
  -- VSCode extension
  vim.g.mapleader = " "
else
  -- ordinary Neovim
  require("plugins")
  require("_key_bindings")
  require("lsp")
  require("treesitter")
  require("completion")
  require("buffer")
  require("_formatter")
  require("_gitsigns")
  -- require("_lualine")
  require("evil_lualine")
  -- require("spaceline")
  -- require("_feline")
  require("telescope-nvim")
  require("_tree")
  require("_gitlinker")
  require("_hover")
  require("_neogen")
  require("_neogit")
  require("_neotest")
  require("_todo_comments")
  require("_colorschemes")
  require("_which-key")
end

-- packer
vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

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
  autocmd BufWritePre * lua vim.lsp.buf.format({async = true})
augroup END
]])

vim.opt.ruler = true
vim.opt.hidden = true
vim.opt.textwidth = 100
vim.opt.colorcolumn = "99"
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
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.title = true
vim.cmd([[
augroup dirchange
  autocmd!
  autocmd DirChanged * let &titlestring=v:event['cwd']
augroup END
]])
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
vim.cmd("filetype on")        -- Enable filetype detection
vim.cmd("filetype indent on") -- Enable filetype-specific indenting
vim.cmd("filetype plugin on") -- Enable filetype-specific plugins

function AddFrozenStringLiteralMagicComment()
  local l = vim.fn.line(".")
  local c = vim.fn.col(".")
  vim.cmd("norm gg")
  vim.cmd("norm O# frozen_string_literal: true")
  vim.cmd("norm o")
  vim.fn.cursor(l + 2, c)
end

-- auto cmds
vim.cmd("autocmd TermOpen * setlocal nonu")
vim.cmd(
  "autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby"
)
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
vim.cmd("autocmd FileType ruby map <leader>rfs :call AddFrozenStringLiteralMagicComment()<CR>")
vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = true})")

-- remaps
-- let mapleader = " "
vim.api.nvim_set_keymap("t", "<leader><Esc>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-T>", "<cmd>vnew term://zsh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-X>", "<Cmd>split term://zsh<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Saving keystrokes when moving between splits
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w><C-j>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w><C-k>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w><C-l>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w><C-h>", { silent = true })

-- split vertically
vim.api.nvim_set_keymap("n", "<C-s><C-v>", "<cmd>vsp<CR>", { noremap = true })
-- split horizontally
vim.api.nvim_set_keymap("n", "<C-s><C-h>", "<cmd>sp<CR>", { noremap = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Telescope find_files prompt_prefix=🔍<CR>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>fH",
  "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files prompt_prefix=🔍🔍<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope commands<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fa", "<cmd>Telescope grep_string<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fe", "<cmd>Telescope env<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Telescope git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gst", "<cmd>Telescope git_stash<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>Telescope git_commits<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>glb", "<cmd>Telescope git_bcommits<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gpr", "<cmd>Telescope gh pull_request<CR>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>gco",
  "<cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>",
  { noremap = true }
)

-- bufferline
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>bdelete<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>Q", "<cmd>bdelete!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true })

-- DiffView
-- vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dff", "<cmd>DiffviewFileHistory %<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { noremap = true })

-- update packages
vim.api.nvim_set_keymap("n", "<C-u><S-u>", "<cmd>PackerSync<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ps", "<cmd>PackerStatus<CR>", { noremap = true })

-- toggle tree
vim.api.nvim_set_keymap("n", "<leader>tt", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tf", ":NvimTreeFindFile<CR>", { noremap = true })

-- format code
vim.api.nvim_set_keymap("n", "<leader>f=", "<cmd>Format<CR>", { noremap = true })

-- Gitsigns
vim.api.nvim_set_keymap("n", "<leader>hn", "<cmd>lua require('gitsigns').next_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hp", "<cmd>lua require('gitsigns').prev_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hR", "<cmd>lua require('gitsigns').reset_buffer()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hb", "<cmd>lua require('gitsigns').blame_line(true)<CR>", { noremap = true })

-- vim test
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>:TestFile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>:TestNearest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>:TestSuite<CR>", { noremap = true })
vim.cmd([[
  let test#strategy = "neovim"
  let test#ruby#use_binstubs = 0
  let test#ruby#rspec#executable = "bundle exec rspec"
]])

-- close search
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", { noremap = true })

-- Copy and save from the clipboard
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>Y", '"+y$', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>yy", '"+yy', { noremap = true })

-- Paste from clipboard
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>P", '"+P', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>P", '"+P', { noremap = true })

-- SymbolsOutline plugin
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>SymbolsOutline<CR>", { noremap = true })

-- Swap horizontally splits
vim.api.nvim_set_keymap("n", "<C-w><S-h>", ":windo wincmd H<CR>", { noremap = true })

-- Swap vertically splits
vim.api.nvim_set_keymap("n", "<C-w><S-k>", ":windo wincmd K<CR>", { noremap = true })

-- Substitute the word under the cursor
vim.api.nvim_set_keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>//", { noremap = true })

-- Search forward for word under the cursor
vim.api.nvim_set_keymap("n", "<leader>h", "/<C-r><C-w><CR>", { noremap = true })

-- Search backward for word under the cursor
vim.api.nvim_set_keymap("n", "<leader>hh", "?<C-r><C-w><CR>", { noremap = true })

-- Save with leader W
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true })

-- Remap Ctrl-q in insert mode to Esc
vim.api.nvim_set_keymap("i", "<C-q>", "<Esc>", { noremap = true })

-- indent
vim.cmd("setlocal autoindent")
vim.cmd("setlocal smartindent")
vim.cmd("setlocal expandtab")
vim.cmd("setlocal shiftwidth=2")
vim.cmd("setlocal tabstop=2")
vim.cmd("setlocal softtabstop=2")
