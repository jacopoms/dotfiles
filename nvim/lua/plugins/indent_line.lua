return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre', 'FileReadPre' },
    main = 'ibl',
    opts = {},
  },
}
