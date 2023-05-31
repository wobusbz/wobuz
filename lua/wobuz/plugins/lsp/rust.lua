local M = {}
M.on_setup = function(lsp, m)
    lsp.setup {
        on_attach = m.on_attach,
        -- capabilities = m.capabilities,
        cmd = {"rust-analyzer"},
        filetypes = {"rust"},
        root_dir = m.utils.root_pattern("Cargo.toml", "rust-project.json"),
        -- settings = {['rust-analyzer'] = {diagnostics = {enable = false}}}
    }
end
return M
