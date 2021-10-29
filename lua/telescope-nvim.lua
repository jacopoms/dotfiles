local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup {
  defaults = {
    mappings = {
      i = { ["<C-l>"] = trouble.open_with_trouble },
      n = { ["<C-l>"] = trouble.open_with_trouble },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
        preview_width = 0.5
      },
      vertical = {
        mirror = false
      }
    },
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
  },
  extensions = {
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  }
}

-- highlight

local cmd = vim.cmd

cmd "hi TelescopeBorder   guifg=#2a2e36"
cmd "hi TelescopePromptBorder   guifg=#2a2e36"
cmd "hi TelescopeResultsBorder  guifg=#2a2e36"
cmd "hi TelescopePreviewBorder  guifg=#525865"
