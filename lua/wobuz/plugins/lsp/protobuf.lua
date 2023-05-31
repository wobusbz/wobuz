local M = {}
M.on_setup = function(lsp, m)
    lsp.setup {
        on_attach = m.on_attach,
        capabilities = m.capabilities,
        cmd = {"bufls", "serve"},
        filetypes = {"proto"},
        root_dir = m.utils.root_pattern("buf.work.yaml", ".git")
    }
end
return M
