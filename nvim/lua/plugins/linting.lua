local project_tools = require("config.project_tools")

local function rubocop_linter()
  local default = require("lint.linters.rubocop")
  local root = project_tools.gemfile_root(0)

  if not root or vim.fn.executable("bundle") ~= 1 then
    return default
  end

  return vim.tbl_deep_extend("force", default, {
    cmd = "bundle",
    cwd = root,
    args = {
      "exec",
      "rubocop",
      "--format",
      "json",
      "--force-exclusion",
      "--server",
      "--stdin",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    },
  })
end

return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      ruby = { "rubocop", "ruby" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      markdown = { "markdownlint" },
    },
    linters = {
      eslint = {
        cmd = function()
          return project_tools.node_tool("eslint", 0)
        end,
      },
      rubocop = rubocop_linter,
    },
  },
}
