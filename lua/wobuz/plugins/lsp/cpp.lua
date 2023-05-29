local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.utils = require 'lspconfig.util'

M.capabilities.textDocument.semanticHighlighting = true
M.capabilities.offsetEncoding = "utf-8"
M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    M.utils.load_mappings("lspconfig", {buffer = bufnr})
end

M.on_setup = function(lsp)
    lsp.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        cmd = {"clangd"},
        filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
        root_dir = M.utils.root_pattern('.clangd', '.clang-tidy',
                                        '.clang-format',
                                        'compile_commands.json',
                                        'compile_flags.txt', 'configure.ac',
                                        '.git'),
        single_file_support = true
    }
end
return M
