return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function()
    require('marks').setup {
      default_mappings = true,
      signs = true,
      mappings = {},
    }
  end,
}
