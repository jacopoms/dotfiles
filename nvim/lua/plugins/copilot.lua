return {
  "zbirenbaum/copilot.lua",
  opts = function(_, opts)
    require("copilot.api").status = require("copilot.status")
    local filetypes = {
      filetypes = {
        yaml = true,
      },
    }
    table.insert(opts, filetypes)
    return opts
  end,
}
