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
    local branch_opts = { "ex.git.branch", max_length = 24, icon = "", crop = { side = "right" } }
    opts.options.theme = "auto"
    opts.options.globalstatus = true
    opts.sections.lualine_b = { branch_opts }

    table.insert(opts.sections.lualine_x, 1, { "copilot", show_colors = true })
  end,
}
