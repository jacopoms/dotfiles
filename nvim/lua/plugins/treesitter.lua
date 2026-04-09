--- Treesitter textobject peek: `lsp_interop.peek_definition_code` was removed from
--- nvim-treesitter-textobjects; LazyVim never read it from nvim-treesitter opts anyway.
--- @param capture string e.g. "@function.outer"
local function ts_peek_definition(capture)
  vim.lsp.buf_request_all(0, "textDocument/definition", vim.lsp.util.make_position_params(), function(results)
    local loc ---@type lsp.Location|lsp.LocationLink|nil
    for _, resp in pairs(results) do
      if resp.result and not resp.err then
        local r = resp.result
        loc = vim.islist(r) and r[1] or r
        break
      end
    end
    if not loc then
      vim.notify("No definition found", vim.log.levels.WARN)
      return
    end
    local uri = loc.targetUri or loc.uri
    local range = loc.targetRange or loc.range
    if not uri or not range then
      return
    end
    local buf = vim.uri_to_bufnr(uri)
    if not vim.api.nvim_buf_is_loaded(buf) then
      vim.fn.bufload(buf)
    end
    local shared = require("nvim-treesitter-textobjects.shared")
    local pos = { range.start.line + 1, range.start.character }
    local tobj = shared.textobject_at_point(capture, "textobjects", buf, pos, {})
    local ts_range = vim.treesitter._range or require("nvim-treesitter-textobjects._range")
    local ft = vim.bo[buf].filetype
    if tobj then
      local sr, _, er, _ = ts_range.unpack4(tobj)
      local contents = vim.api.nvim_buf_get_lines(buf, sr, er + 1, false)
      vim.lsp.util.open_floating_preview(contents, ft, { border = "rounded", focus_id = "location" })
    else
      vim.lsp.util.preview_location(loc, { border = "rounded" })
    end
  end)
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "eex",
        "elixir",
        "erlang",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "heex",
        "helm",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "sql",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    keys = {
      {
        "<leader>gqf",
        function()
          ts_peek_definition("@function.outer")
        end,
        desc = "Peek definition (function body)",
      },
      {
        "<leader>gqc",
        function()
          ts_peek_definition("@class.outer")
        end,
        desc = "Peek definition (class body)",
      },
    },
  },
}
