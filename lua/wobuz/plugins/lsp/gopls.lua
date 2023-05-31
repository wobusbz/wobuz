return {
    on_setup = function(lsp, m)
        lsp.setup {
            on_attach = m.on_attach,
            capabilities = m.capabilities,
            cmd = {"gopls"},
            filetypes = {"go", "gomod", "gowork", "gotmpl"},
            root_dir = m.utils.root_pattern("go.work", "go.mod", ".git"),
            single_file_support = true,
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    experimentalPostfixCompletions = true,
                    analyses = {unusedparams = true, shadow = true},
                    staticcheck = true
                }
            },
            init_options = {usePlaceholders = true}
        }
    end
}
