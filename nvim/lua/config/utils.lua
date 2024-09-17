-- Utils funtions for lua/config/plugins.lua
-- @class lua.config.utils

local M = {}
-- @param mode string|string[]
-- @param lhs string
-- @param rhs string|function
-- @param opts? vim.keymap.set.Opts
-- @return nil
function M.map(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.icons = {
  error = '',
  warning = '',
  hint = '',
  info = '',
}

return M
