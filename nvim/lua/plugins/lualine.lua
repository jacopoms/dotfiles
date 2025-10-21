-- local Lazyvim = require("lazyvim")

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "dokwork/lualine-ex" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "folke/sidekick.nvim" },
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

    -- CLI session status
    table.insert(opts.sections.lualine_y, 2, {
      function()
        local ok, status = pcall(require("sidekick.status").cli)
        if ok and status then
          local cli_status = status()
          return "  " .. (#cli_status > 1 and #cli_status or "")
        end
        return ""
      end,
      cond = function()
        local ok, status = pcall(require("sidekick.status").cli)
        if ok and status then
          return #status() > 0
        end
        return false
      end,
      color = function()
        return "Special"
      end,
      -- function()
      --   local status = require("sidekick.status").cli()
      --   return " " .. (#status > 1 and #status or "")
      -- end,
      -- cond = function()
      --   return #require("sidekick.status").cli() > 0
      -- end,
      -- color = function()
      --   return { fg = Snacks.util.color("Special") }
      -- end,
    })
  end,
}
