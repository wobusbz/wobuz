local M = {}
M.on_setup = function(lsp, m)
    local root_pattern = m.utils.root_pattern('.clangd', '.clang-tidy',
                                              '.clang-format',
                                              'compile_commands.json',
                                              'compile_flags.txt',
                                              'configure.ac', '.git')
    lsp.setup {
        on_attach = m.on_attach,
        capabilities = m.capabilities,
        root_dir = function(fname)
            local filename = m.utils.path.is_absolute(fname) and fname or
                                 m.utils.path.join(vim.loop.cwd(), fname)
            return root_pattern(filename) or m.utils.path.dirname(filename)
        end,
        cmd = {
            "clangd", "--clang-tidy", "--completion-style=detailed",
            "--cross-file-rename=true", "--header-insertion=iwyu",
            "--pch-storage=memory", "--function-arg-placeholders=false",
            "--log=verbose", "--ranking-model=decision_forest",
            "--header-insertion-decorators", "-j=12", "--pretty"
        },
        init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true
        },
        settings = {clangd = {compileFlags = {'-std=c++17'}}}
    }
end
return M
