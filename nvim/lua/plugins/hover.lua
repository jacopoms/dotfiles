return {
  "lewis6991/hover.nvim",
  lazy = true,
  config = function()
    require("hover").setup({
      init = function()
        -- Require providers
        require("hover.providers.lsp")
        require("hover.providers.gh")
        -- require('hover.providers.jira')
        require("hover.providers.man")
        require("hover.providers.dictionary")
      end,
      preview_opts = {
        border = true,
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = true,
      title = true,
    })
    -- Mouse support
    vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
    vim.o.mousemoveevent = true
  end,
  keys = {
    {
      "K",
      function()
        require("hover").hover()
      end,
      mode = "n",
    },
    {
      "gK",
      function()
        require("hover").hover_select()
      end,
      mode = "n",
    },
    {
      "<C-p>",
      function()
        require("hover").hover_switch("previous")
      end,
      mode = "n",
    },
    {
      "<C-n>",
      function()
        require("hover").hover_switch("next")
      end,
      mode = "n",
    },
  },
}

-- Setup keymaps
-- vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
-- vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
