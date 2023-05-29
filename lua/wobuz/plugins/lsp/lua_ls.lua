local M = {}
M.on_setup = function(lsp, m)
    lsp.setup {
        on_attach = m.on_attach,
        capabilities = m.capabilities,
        cmd = {"lua-language-server"},
        filetypes = {"lua"},
        log_level = 2,
        root_dir = m.utils.root_pattern(".luarc.json", ".luarc.jsonc",
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
