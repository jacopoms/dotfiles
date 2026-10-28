-- Ramen "workspace": two repos searched together, with one neo-tree root per repo.
-- Neovim has a single cwd, so we scope pickers via `dirs` instead of changing cwd.
-- LSP attaches per buffer (root from Gemfile/tsconfig.json), so it is unaffected.
local root = os.getenv("PROJECTS_ROOT") or vim.fn.expand("~/Projects")
local ramen = root .. "/ramen"
local ramen_api = root .. "/ramen_api"
local workspace = { ramen, ramen_api }

local function tree(dir)
  return function()
    require("neo-tree.command").execute({ toggle = true, dir = dir })
  end
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          projects = {
            dev = { root },
            patterns = { ".git", "Gemfile", "package.json", "mix.exs" },
          },
        },
      },
    },
    keys = {
      -- defined here because the fzf extra wins over snacks_picker, which would have provided it
      {
        "<leader>fp",
        function()
          Snacks.picker.projects()
        end,
        desc = "Projects",
      },
      {
        "<leader>fw",
        function()
          Snacks.picker.files({ dirs = workspace })
        end,
        desc = "Find Files (ramen + ramen_api)",
      },
      {
        "<leader>fW",
        function()
          Snacks.picker.grep({ dirs = workspace })
        end,
        desc = "Grep (ramen + ramen_api)",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e1", tree(ramen), desc = "Explorer (ramen)" },
      { "<leader>e2", tree(ramen_api), desc = "Explorer (ramen_api)" },
    },
  },
}
