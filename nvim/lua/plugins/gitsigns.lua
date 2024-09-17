local utils = require 'config.utils'
return {
  'lewis6991/gitsigns.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  },
  config = function(_, opts)
    local gitsigns = require 'gitsigns'
    gitsigns.setup {
      on_attach = function(bufnr)
        -- Navigation
        utils.map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal { ']h', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end)

        utils.map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal { '[h', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end)

        -- Actions
        utils.map('n', '<leader>hs', gitsigns.stage_hunk, { noremap = true, desc = 'Stage hunk' })
        utils.map('n', '<leader>hr', gitsigns.reset_hunk, { noremap = true, desc = 'Reset hunk' })
        utils.map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { noremap = true, desc = 'Stage hunk in visual mode' })
        utils.map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { noremap = true, desc = 'Reset hunk in visual mode' })
        utils.map('n', '<leader>hS', gitsigns.stage_buffer, { noremap = true, desc = 'Stage buffer' })
        utils.map('n', '<leader>hu', gitsigns.undo_stage_hunk, { noremap = true, desc = 'Undo stage hunk' })
        utils.map('n', '<leader>hR', gitsigns.reset_buffer, { noremap = true, desc = 'Reset buffer' })
        utils.map('n', '<leader>hp', gitsigns.preview_hunk, { noremap = true, desc = 'Preview hunk' })
        utils.map('n', '<leader>hb', function()
          gitsigns.blame_line { full = true }
        end, { noremap = true, desc = 'Blame line' })
        utils.map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { noremap = true, desc = 'Toggle blame line' })
        utils.map('n', '<leader>hd', gitsigns.diffthis, { noremap = true, desc = 'Diff this' })
        utils.map('n', '<leader>hD', function()
          gitsigns.diffthis '~'
        end, { noremap = true, desc = 'Diff this (cached)' })
        utils.map('n', '<leader>td', gitsigns.toggle_deleted, { noremap = true, desc = 'Toggle deleted' })

        -- Text object
        utils.map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { noremap = true, desc = 'Select hunk' })
      end,
    }
  end,
}
