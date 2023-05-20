return {
    "neovim/nvim-lspconfig",
    config = function()
        local function lsp_highlight_document(client)
            -- Set autocommands conditional on server_capabilities
            local status_ok, illuminate = pcall(require, "illuminate")
            if not status_ok then return end
            illuminate.on_attach(client)
            -- end
        end

        -- Add additional capabilities supported by nvim-cmp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
       
        local cmp = require('cmp')
        local lspconfig = require('lspconfig')
        lspconfig.gopls.setup({
            on_attach = function(client, buff)
                -- require('lsp_signature').on_attach() -- 如果你想使用函数签名插件，可以添加这行代码
                lsp_highlight_document(client)
            end,
            settings = {
                gopls = {analyses = {unusedparams = true}, staticcheck = true}
            },
            capabilities = capabilities
        })
    end
}
