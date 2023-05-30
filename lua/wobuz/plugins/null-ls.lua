return {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = {
                -- 导入包的自动修复
                null_ls.builtins.formatting.gofumpt, -- 格式化代码
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.golines,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format
            },
            debug = false,
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr
                    })
                    vim.api.nvim_create_autocmd("BufWritePre ", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.formatting_sync()
                        end
                    })
                end
            end
        })
    end
}
