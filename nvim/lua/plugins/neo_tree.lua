return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    window = {
      mappings = {
        ["S"] = "split_with_window_picker",
        ["s"] = "vsplit_with_window_picker",
      },
    },
  },
}
