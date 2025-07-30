-- local Lazyvim = require("lazyvim")

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "dokwork/lualine-ex" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
  },
  optional = true,
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = ""
    local branch_opts = { "ex.git.branch", max_length = 24, icon = "", crop = { side = "right" } }
    local lualine_codecompanion = require("utils.lualine_codecompanion")
    opts.options.theme = "auto"
    opts.options.globalstatus = true
    opts.sections.lualine_b = { branch_opts }
    table.insert(opts.sections.lualine_x, lualine_codecompanion)
  end,
}
