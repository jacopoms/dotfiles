local icons = require('config.utils').icons
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'AndreM222/copilot-lualine',
  },
  event = 'VeryLazy',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        {
          'mode',
          icons_enabled = true,
        },
      },
      lualine_b = {
        'branch',
      },
      lualine_c = {
        {
          'diagnostics',

          -- Table of diagnostic sources, available sources are:
          --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          -- or a function that returns a table as such:
          --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
          sources = { 'nvim_diagnostic' },

          -- Displays diagnostics for the defined severity types
          sections = { 'error', 'warn', 'info', 'hint' },

          diagnostics_color = {
            -- Same values as the general color option can be used here.
            error = 'DiagnosticError', -- Changes diagnostics' error color.
            warn = 'DiagnosticWarn', -- Changes diagnostics' warn color.
            info = 'DiagnosticInfo', -- Changes diagnostics' info color.
            hint = 'DiagnosticHint', -- Changes diagnostics' hint color.
          },
          symbols = {
            error = icons.error .. ' ',
            warn = icons.warning .. ' ',
            info = icons.info .. ' ',
            hint = icons.hint .. ' ',
          },
          colored = true, -- Displays diagnostics status in color if set to true.
          update_in_insert = true, -- Update diagnostics in insert mode.
          always_visible = false, -- Show diagnostics even if there are none.
        },
        { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
        {
          'filename',
          path = 1,
        },
      },
      lualine_x = {
        {
          'copilot',
          show_colors = true,
        },
          -- stylua: ignore
        {
          function()
            return require('noice').api.status.command.get()
          end,
          cond = function()
            return package.loaded['noice'] and require('noice').api.status.command.has()
          end,
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
        },
        -- stylua: ignore
        'encoding',
        'fileformat',
        'diff',
      },
      lualine_y = {
        { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
        { 'location', padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        function()
          return ' ' .. os.date '%R'
        end,
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'neo-tree', 'lazy' },
  },
}
