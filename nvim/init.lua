-- Hello World

-- Neovim configuration entry point
-- Ordinary Neovim
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.vscode then
  -- LazyVim
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("user.vscode_keymaps")
end
