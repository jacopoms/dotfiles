-- local Lazyvim = require("lazyvim")

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "dokwork/lualine-ex" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
  },
  -- optional = true,
  event = "VeryLazy",
  lazy = false,
  opts = function(_, opts)
    opts.options.theme = "auto"
    opts.options.globalstatus = true
    opts.sections = opts.sections or {}
    opts.sections.lualine_b = opts.sections.lualine_b or {}
    opts.sections.lualine_c = opts.sections.lualine_c or {}
    opts.sections.lualine_y = opts.sections.lualine_y or {}

    local branch_opts = { "ex.git.branch", max_length = 24, icon = " ", crop = { side = "right" } }
    opts.sections.lualine_b = { branch_opts }
    table.insert(opts.sections.lualine_c, { "navic", color_correction = "dynamic" })
  end,
}
