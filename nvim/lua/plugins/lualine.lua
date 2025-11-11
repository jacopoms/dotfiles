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
    -- Copilot status
    table.insert(opts.sections.lualine_c, {
      function()
        return " "
      end,
      color = function()
        local status = require("sidekick.status").get()
        if status then
          return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
        end
      end,
      cond = function()
        local status = require("sidekick.status")
        return status.get() ~= nil
      end,
    })

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
  end,
}
