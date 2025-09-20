-- Autocmds are automatically loaded on the VeryLazy event-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- Toggle relative line numbers when entering a buffer, window, or leaving insert mode
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.wo.nu and vim.fn.mode() ~= "i" then
      vim.wo.rnu = true
    end
  end,
})

-- Disable relative numbers when leaving a buffer, window, or entering insert mode
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.wo.nu then
      vim.wo.rnu = false
    end
  end,
})

-- Remove trailing whitespace before writing a buffer
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

-- Test settings
vim.g["test#strategy"] = "neovim"
vim.g["test#ruby#use_binstubs"] = 0
vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"

-- User command to copy the current file path to the clipboard
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
