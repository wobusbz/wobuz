return function()
    require("lspconfig.ui.windows").default_options.border = "rounded"

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.offsetEncoding = 'utf-8'
    capabilities.textDocument.completion.completionItem = {
        documentationFormat = {"markdown", "plaintext"},
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = {valueSet = {1}},
        resolveSupport = {
            properties = {"documentation", "detail", "additionalTextEdits"}
        }
    }
    require('lspconfig').clangd.setup {
        capabilities = capabilities,
        on_init = function(client, _)
            if client.supports_method "textDocument/semanticTokens" then
                client.server_capabilities.semanticTokensProvider = nil
            end
        end,
        settings = {
            Lua = {
                diagnostics = {globals = {"vim"}},
                maxPreload = 100000,
                preloadFileSize = 10000
            }
        }
    }
end
