local lualine = require('lualine')

local config = {
  options = {
    -- theme = "auto",
    icons_enabled = true,
    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      {
        "diff",
        diff_color = {
          -- specific colors from theme with bg color of section
          added    = "GitSignsAdd",
          modified = "GitSignsChange",
          removed  = "GitSignsDelete",
        },
        symbols = {
          added    = " ",
          modified = " ",
          removed  = " ",
        },
      },
    },
    lualine_c = { 'filename', 'branch' },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        diagnostics_color = {
          -- specific colors from theme with bg color of section
          error = "LualineDiagnosticError",
          warn  = "LualineDiagnosticWarn",
          info  = "LualineDiagnosticInfo",
          hint  = "LualineDiagnosticHint",
        },
        symbols = {
          error = " ",
          warn  = " ",
          info  = " ",
          hint  = " ",
        },
      },
    },
    lualine_y = { 'fileformat', 'filetype', 'encoding','progress' },
  },
  tabline = {},
  extensions = {
    'fugitive',
    'nvim-tree',
  }
}


lualine.setup(config)
