local M = {}
M.on_setup = function(lsp, m)
    lsp.setup {
        on_attach = m.on_attach,
        capabilities = m.capabilities,
        cmd = {"clangd"},
        filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
        root_dir = m.utils.root_pattern('.clangd', '.clang-tidy',
                                        '.clang-format',
                                        'compile_commands.json',
                                        'compile_flags.txt', 'configure.ac',
                                        '.git'),
        single_file_support = true,
    }
end
return M
