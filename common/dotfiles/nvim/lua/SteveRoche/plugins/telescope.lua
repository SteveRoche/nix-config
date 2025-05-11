local builtin = require('telescope.builtin')

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>f', builtin.find_files, desc = 'Find File' },
    { '<leader>/', builtin.live_grep, desc = 'Global Search' },
    { '<leader>b', builtin.buffers, desc = 'Find Buffer' },
    { '<leader>H', builtin.help_tags, desc = 'Search Help' },
    { '<leader>d', builtin.diagnostics, desc = 'Diagnostics' },
  },
}
