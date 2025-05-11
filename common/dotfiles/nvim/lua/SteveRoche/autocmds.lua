vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = '*',
  callback = function()
    vim.wo.relativenumber = false
  end
})

vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*',
  callback = function()
    vim.wo.relativenumber = true
  end
})
