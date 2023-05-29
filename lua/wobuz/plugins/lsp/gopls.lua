local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local utils = require 'lspconfig.util'

M.on_setup = function(lsp)
    lsp.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        cmd = {"gopls"},
        filetypes = {"go", "gomod", "gowork", "gotmpl"},
        root_dir = utils.root_pattern("go.work", "go.mod", ".git"),
        single_file_support = true,
        settings = {gopls = {completeUnimported = true, usePlaceholders = true}}
    }
end
return M
