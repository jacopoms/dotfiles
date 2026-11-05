--- Resolve project-local CLI tools (Bundler, node_modules) from the current buffer.
--- Falls back to names on PATH when no project marker is found.
local M = {}

---@param bufnr? integer
---@return string
function M.buffer_path(bufnr)
  bufnr = bufnr or 0
  local path = vim.api.nvim_buf_get_name(bufnr)
  if path == "" then
    return vim.loop.cwd()
  end
  return path
end

---@param bufnr? integer
---@param markers string|string[]
---@return string|nil
function M.root(bufnr, markers)
  return vim.fs.root(M.buffer_path(bufnr), markers)
end

---@param bufnr? integer
---@return string|nil
function M.gemfile_root(bufnr)
  return M.root(bufnr, { "Gemfile" })
end

---@param bufnr? integer
---@return string|nil
function M.node_root(bufnr)
  return M.root(bufnr, { "package.json", "pnpm-lock.yaml", "yarn.lock", "package-lock.json" })
end

---@param bin string e.g. "eslint", "prettier"
---@param bufnr? integer
---@return string|nil absolute path when found upward from the buffer
function M.node_modules_bin(bin, bufnr)
  local start = M.buffer_path(bufnr)
  local dir = vim.fs.dirname(start)
  if dir == nil or dir == "" then
    dir = start
  end

  local matches = vim.fs.find("node_modules/.bin/" .. bin, {
    path = dir,
    upward = true,
    limit = 1,
  })

  if #matches > 0 and vim.fn.executable(matches[1]) == 1 then
    return matches[1]
  end

  return nil
end

---@param bin string
---@param bufnr? integer
---@return string executable path or bare name for PATH fallback
function M.node_tool(bin, bufnr)
  return M.node_modules_bin(bin, bufnr) or bin
end

return M
