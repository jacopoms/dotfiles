require('neogen').setup({
  enabled = true,
  snippet_engine = 'vsnip'
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>nf", ":lua require('neogen').generate()<CR>", opts)

require('spectre').setup()
