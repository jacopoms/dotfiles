-- Tokyonight
local M = {}
-- Example config in Lua
-- "storm" ,"night" "day"
vim.g.tokyonight_style = "day"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_hide_inactive_statusline = true
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

function M.toggle()
  local styles = { "storm", "night", "day" }
  local index = {}
  for k, v in pairs(styles) do index[v] = k end
  vim.g.tokyonight_style = styles[index[vim.g.tokyonight_style] + 1] or "storm"
  vim.cmd [[colorscheme tokyonight]]
end

-- nightfox
require("nightfox").setup({
  options = {
    transparent = true,
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic", "bold",
    }
  }
})

-- onedark
require("onedark").setup({
  style = "dark"
})

-- sonokai
vim.g.sonokai_style = "maia"

-- material
vim.g.material_style = "palenight"

require("material").setup({
  lualine_style = "default",
  contrast = {
    sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = true, -- Enable contrast for floating windows
    line_numbers = true, -- Enable contrast background for line numbers
    sign_column = false, -- Enable contrast background for the sign column
    cursor_line = true, -- Enable darker background for the cursor line
    non_current_windows = true, -- Enable darker background for non-current windows
    popup_menu = true, -- Enable lighter background for the popup menu
  },
  high_visibility = {
    lighter = true, -- Enable higher contrast text for lighter style
    darker = true, -- Enable higher contrast text for darker style
  },
})
-- Load the colorscheme
-- vim.cmd [[set background=light]]
vim.cmd [[set termguicolors]]
vim.cmd [[colorscheme onedark]]


-- Setting up colorizer in newvim
require("colorizer").setup()

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
