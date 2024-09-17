-- lazy.nvim
return {
  'm4xshen/hardtime.nvim',
  lazy = true,
  event = 'InsertEnter',
  dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
}
