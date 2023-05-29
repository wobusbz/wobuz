local M = {}
local utils = require 'lspconfig.util'
M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    utils.load_mappings("lspconfig", {buffer = bufnr})
end
M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.on_setup = function(lsp)
    lsp.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        cmd = {"lua-language-server"},
        filetypes = {"lua"},
        log_level = 2,
        root_dir = utils.root_pattern(".luarc.json", ".luarc.jsonc",
                                      ".luacheckrc", ".stylua.toml",
                                      "stylua.toml", "selene.toml",
                                      "selene.yml", ".git"),
        single_file_support = true,
        settings = {
            Lua = {
                telemetry = {enable = true},
                diagnostics = {
                    -- 关闭警告信息
                    globals = {'vim', 'packer_plugins'},
                    disable = {'unused-local'}
                }
            }
        }
    }
end
return M
