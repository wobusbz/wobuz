local M = {}
M.on_setup = function(lsp, m)
    lsp.setup {
        on_attach = m.on_attach,
        capabilities = m.capabilities,
        cmd = {"bufls", "serve"},
        filetypes = {"sql", "mysql"},
    }
end
return M
