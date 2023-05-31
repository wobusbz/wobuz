local M = {}
M.on_setup = function(lsp, m)
    lsp.setup {
        on_attach = m.on_attach,
        capabilities = m.capabilities,
        cmd = {"sql-language-server", "up", "--method", "stdio"},
        filetypes = {"sql", "mysql"}
    }
end
return M
