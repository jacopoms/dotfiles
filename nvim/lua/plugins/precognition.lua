return {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>ue",
      function()
        if require("precognition").toggle() then
          vim.notify("precognition on")
        else
          vim.notify("precognition off")
        end
      end,
      mode = "n",
      desc = "enable Precognition",
    },
  },
}
