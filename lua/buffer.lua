require("bufferline").setup {
  options = {
    -- view = "multiwindow",
    show_close_icon = true,
    show_buffer_close_icons = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, _diagnostics_dict, _context)
      local signs = { error = ' ', warning = ' ', hint = ' ', info = ' ' }

      -- print('level: ' .. level)
      local icon = signs[level]
      return " " .. icon .. count
    end
  },
}
