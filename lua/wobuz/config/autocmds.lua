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

--vim.api.nvim_exec([[
--augroup AutoCmdGroup
--  autocmd!
--  autocmd BufReadPost * lua if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then vim.api.nvim_command("normal! g'\"") end
--augroup END
--]], false)
