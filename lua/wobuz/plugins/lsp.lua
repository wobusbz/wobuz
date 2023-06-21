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

            local lspconfig = require("lspconfig")
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
                            opts.root_pattern =
                                lspconfig.util.root_pattern('.clangd',
                                                            '.clang-tidy',
                                                            '.clang-format',
                                                            'compile_commands.json',
                                                            'compile_flags.txt',
                                                            'configure.ac',
                                                            '.git')
                        end
                        if server_name == "lua_ls" then
                            opts = vim.tbl_deep_extend("force",
                                                       require "wobuz.plugins.setting.lua_ls",
                                                       opts)
                        end
                        lspconfig[server_name].setup(opts)
                    end
                }
            })
        end
    }
}
