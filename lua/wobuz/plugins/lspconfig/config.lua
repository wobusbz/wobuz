return function()
    require("lspconfig.ui.windows").default_options.border = "rounded"

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.offsetEncoding = 'utf-8'
    require('lspconfig').clangd.setup {capabilities = capabilities}

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    -- vim.api.nvim_create_autocmd("LspAttach", {
    --     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    --     callback = function(ev)
    --         -- Enable completion triggered by <c-x><c-o>
    --         vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    --     end
    -- })
end
