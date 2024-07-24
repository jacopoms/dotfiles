return {
  { "mg979/vim-visual-multi" },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>dfo", "<cmd>DiffviewOpen<CR>", noremap = true },
      { "<leader>dff", "<cmd>DiffviewFileHistory %<CR>", noremap = true },
      { "<leader>dc", "<cmd>DiffviewClose<CR>", noremap = true },
    },
  },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" }, -- open file on github
  { "machakann/vim-highlightedyank" },
  -- { "elixir-editors/vim-elixir" },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "BufNewFile", "BufReadPre", "FileReadPre" },
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = true,
    event = { "BufNewFile", "BufReadPre", "FileReadPre" },
    opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = "right",
      width = 25,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = "Pmenu",
      keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
      },
      lsp_blacklist = {},
    },
    keys = {
      { "<leader>oo", "<cmd>SymbolsOutline<CR>", noremap = true },
    },
  },
  { "ryanoasis/vim-devicons" },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    opts = {},
  },
  { "norcalli/nvim-colorizer.lua" },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
}
