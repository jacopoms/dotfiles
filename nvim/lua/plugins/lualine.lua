-- local Lazyvim = require("lazyvim")
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "AndreM222/copilot-lualine" },
    { "dokwork/lualine-ex" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
  },
  optional = true,
  event = "VeryLazy",
  opts = function(_, opts)
    local branch_opts = {
      "ex.git.branch",
      -- It can be a function which receive an actual component value, and should return a number;
      -- or it can be a number:
      -- * any number >= 1 is max count of symbols in the branch name
      -- * a number between 0 and 1 means fraction of the {vim.o.columns}
      --   for {laststatus} == 3, and fraction of the {vim.api.nvim_win_get_width(0)}
      --   in other cases.
      -- When this option is defined, a component value will be cropped if it's longer then
      -- a value of this property.
      max_length = 0.2,

      -- Follow options actual only if {max_length} is defined:
      crop = {
        -- The string which will be used instead of cropped part.
        stub = { "…" },

        -- The side from which a value should be cropped. It may be 'left' or 'right'.
        -- If not specified, result depends on the component section:
        --   'right' for a|b|c
        --   'left' for x|y|z
        side = { "left" },
      },
    }

    opts.options.globalstatus = true
    opts.sections.lualine_b = { branch_opts }

    table.insert(opts.sections.lualine_x, 1, { "copilot", show_colors = true })
  end,
}
