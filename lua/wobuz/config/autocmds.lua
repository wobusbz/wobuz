-- vim.cmd('autocmd BufEnter * lua require("completion").on_attach()')


vim.cmd([[
    augroup TimeoutlenSettings
    autocmd!
    autocmd InsertEnter * set timeoutlen=30
    autocmd InsertEnter * set updatetime=30
    autocmd InsertLeave * set timeoutlen=300
    autocmd InsertLeave * set updatetime=300
  augroup END
]])