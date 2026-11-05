local project_tools = require("config.project_tools")

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      local conform_util = require("conform.util")

      opts.formatters.prettier = vim.tbl_deep_extend("force", opts.formatters.prettier or {}, {
        command = conform_util.from_node_modules("prettier"),
        cwd = conform_util.root_file({ "package.json" }),
      })

      local rubocop_fmt = require("conform.formatters.rubocop")
      opts.formatters.rubocop = vim.tbl_deep_extend("force", rubocop_fmt, {
        cwd = conform_util.root_file({ "Gemfile" }),
        command = function(self, ctx)
          local root = vim.fs.root(ctx.dirname, { "Gemfile" })
          if root and vim.uv.fs_stat(root .. "/Gemfile") and vim.fn.executable("bundle") == 1 then
            return "bundle"
          end
          return "rubocop"
        end,
        args = function(self, ctx)
          local rubocop_args = { "--server", "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" }
          local root = vim.fs.root(ctx.dirname, { "Gemfile" })
          if root and vim.uv.fs_stat(root .. "/Gemfile") and vim.fn.executable("bundle") == 1 then
            return vim.list_extend({ "exec", "rubocop" }, rubocop_args)
          end
          return rubocop_args
        end,
      })
    end,
  },
}
