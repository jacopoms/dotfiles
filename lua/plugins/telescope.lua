return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=auto",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--sort=path",
          },
          layout_strategy = "horizontal",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
            height = 25,
            bottom_pane = {
              mirror = false,
              preview_width = 0.5,
              prompt_position = "top",
            },
            horizontal = {
              width = 0.90,
              height = 0.90,
              prompt_position = "top",
            },
          },
          winblend = 0,
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },
}
