local Util = require("lazyvim.util")
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
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=auto",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--sort=path",
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
  },
}
