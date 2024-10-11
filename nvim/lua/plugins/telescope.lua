local Util = require("lazyvim.util")
local actions = require("telescope.actions")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
return {
  "telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        Util.on_load("telescope.nvim", function()
          require("telescope").load_extension("fzf")
        end)
      end,
    },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
      config = function()
        Util.on_load("telescope.nvim", function()
          require("telescope").load_extension("live_grep_args")
        end)
      end,
    },
  },
  config = function()
    local lga = require("telescope-live-grep-args.actions")
    require("telescope").setup({
      theme = "dropdown",
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim", -- add this value
        },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
          height = 25,
          bottom_pane = {
            mirror = false,
            preview_width = 0.5,
            prompt_position = "top",
          },
          horizontal = {
            width = 0.90,
            height = 0.90,
            prompt_position = "top",
          },
        },
        winblend = 0,
        mappings = {
          i = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
          },
          n = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = false,
        },
        live_grep = {
          hidden = true,
        },
        live_grep_args = {
          hidden = true,
        },
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          mappings = {
            i = {
              ["<C-d>"] = "delete_buffer",
            },
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-j>"] = lga.quote_prompt(),
              ["<C-u>"] = lga.quote_prompt({ postfix = " --iglob " }),
            },
          },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>sl",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Search with live greps args",
    },
    {
      "<leader>sf",
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
      noremap = true,
      desc = "Fuzzily search in current buffer",
    },
  },
}
