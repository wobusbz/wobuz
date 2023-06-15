return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        cmd = {
            "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll",
            "MasonLog"
        },
        config = function() require('mason').setup() end
    }, {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"neovim/nvim-lspconfig"},
        config = function()
            local handler = require("wobuz.plugins.setting.handlers")
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name) -- default handler (optional)
                        local opts = {
                            on_attach = handler.on_attach,
                            capabilities = handler.capabilities,
                            flags = {
                                allow_incremental_sync = false,
                                debounce_text_changes = 500
                            }
                        }
                        if server_name == "gopls" then
                            opts = vim.tbl_deep_extend("force",
                                                       require "wobuz.plugins.setting.gopls",
                                                       opts)
                        end
                        if server_name == "clangd" then
                            opts = vim.tbl_deep_extend("force",
                                                       require "wobuz.plugins.setting.clangd",
                                                       opts)
                        end
                        if server_name == "sumneko_lua" then
                            opts = vim.tbl_deep_extend("force",
                                                       require "wobuz.plugins.setting.sumneko_lua",
                                                       opts)
                        end
                        require("lspconfig")[server_name].setup(opts)
                    end
                }
            })
        end
    }
}
