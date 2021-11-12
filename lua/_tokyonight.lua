local M = {}

-- Example config in Lua
-- "storm" ,"night" "day"
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]

function M.toggle()
  local styles = { 'storm', 'night', 'day'}
  local index={}
  for k,v in pairs(styles) do index[v]=k end
  vim.g.tokyonight_style =  styles[index[vim.g.tokyonight_style] + 1] or 'storm'
  vim.cmd[[colorscheme tokyonight]]
end

return M
