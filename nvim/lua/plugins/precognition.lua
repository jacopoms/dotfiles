return {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  opts = {
    startVisible = false,
  },
  keys = {
    {
      "<leader>uE",
      function()
        if require("precognition").toggle() then
          vim.notify("precognition on")
        else
          vim.notify("precognition off")
        end
      end,
      mode = "n",
      desc = "Toggle Precognition",
    },
    {
      "<leader>ue",
      function()
        require("precognition").peek()
      end,
      mode = "n",
      desc = "Peek Precognition hints",
    },
  },
}
