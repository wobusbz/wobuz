local M = {}
M.utils = require 'lspconfig.util'
M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    M.utils.load_mappings("lspconfig", {buffer = bufnr})
end
M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.offsetEncoding = "utf-8"
M.capabilities.textDocument.semanticHighlighting = true
M.capabilities.textDocument.completion.completionItem = {
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
return M
