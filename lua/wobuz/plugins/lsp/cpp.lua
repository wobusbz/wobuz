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
        settings = {
            clangd = {
                fallbackFlags = {
                    "-pedantic", "-Wall", "-Wextra", "-Wcast-align",
                    "-Wdouble-promotion", "-Wformat=2",
                    "-Wimplicit-fallthrough", "-Wmisleading-indentation",
                    "-Wnon-virtual-dtor", "-Wnull-dereference",
                    "-Wold-style-cast", "-Woverloaded-virtual", "-Wpedantic",
                    "-Wshadow", "-Wunused", "-pthread", "-fuse-ld=lld",
                    "-fsanitize=address", "-fsanitize=undefined",
                    "-stdlib=libc++", "-std=c++20"
                }
            }
        }
    }
end
return M
