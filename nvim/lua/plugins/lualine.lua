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
    opts.options.theme = "auto"
    opts.options.globalstatus = true
    opts.sections = opts.sections or {}
    opts.sections.lualine_b = opts.sections.lualine_b or {}
    opts.sections.lualine_c = opts.sections.lualine_c or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}
    local branch_opts = { "ex.git.branch", max_length = 24, icon = "", crop = { side = "right" } }
    table.insert(opts.sections.lualine_c, { "navic", color_correction = "dynamic" })
    -- CLI session status
    table.insert(opts.sections.lualine_x, 2, {
      function()
        local status = require("sidekick.status").cli()
        return " " .. (#status > 1 and #status or "")
      end,
      cond = function()
        return #require("sidekick.status").cli() > 0
      end,
      color = function()
        return "Special"
      end,
    })
    opts.sections.lualine_b = { branch_opts }
  end,
}
