-- Tokyonight
local M = {}
-- Example config in Lua
-- 'storm' ,'night' 'day'
vim.g.tokyonight_style = 'day'
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
vim.g.tokyonight_hide_inactive_statusline = true
-- Change the 'hint' color to the 'orange' color, and make the 'error' color bright red
vim.g.tokyonight_colors = { hint = 'orange', error = '#ff0000' }

function M.toggle()
  local styles = { 'storm', 'night', 'day'}
  local index={}
  for k,v in pairs(styles) do index[v]=k end
  vim.g.tokyonight_style =  styles[index[vim.g.tokyonight_style] + 1] or 'storm'
  vim.cmd[[colorscheme tokyonight]]
end


-- nightfox
require('nightfox').setup({
  options = {
    transparent = true,
    styles = {
      comments = 'italic',
      keywords = 'bold',
      types = 'italic,bold',
    }
  }
})


-- onedark
require('onedark').setup({
  style = 'deep'
})

-- catpuccin
require('catppuccin').setup()


-- Load the colorscheme
vim.cmd[[set background=light]]
vim.cmd[[colorscheme solarized8]]

