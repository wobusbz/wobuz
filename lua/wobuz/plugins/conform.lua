return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                go = {"goimports", "gofmt"},
                cpp = {"clang-format"}
            },
            format_on_save = {lsp_fallback = true, timeout_ms = 500},
            format_after_save = {lsp_fallback = true},
            notify_on_error = true
        })
    end
}
