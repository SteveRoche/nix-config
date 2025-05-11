return {
  'mrjones2014/legendary.nvim',
  version = 'v2.13.13',
  lazy = false,
  config = function()
    require('legendary').setup({
      select = require('telescope.themes').get_dropdown({})
    })
    vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>Legendary<CR>', { noremap = true, silent = true })
  end
}
