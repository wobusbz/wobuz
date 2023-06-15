return {
    {
        "williamboman/mason.nvim",
        event = "User FileOpened",
        cmd = {
            "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll",
            "MasonLog"
        },
        opts = {enure_installed = {"gopls"}}
    }, {
        "neovim/nvim-lspconfig",
        config = function()
            local servers = {
                gopls = require("wobuz.plugins.lsp.gopls"),
                lua_ls = require("wobuz.plugins.lsp.lua_ls"),
                ccls = require("wobuz.plugins.lsp.cpp"),
                bufls = require("wobuz.plugins.lsp.protobuf"),
                sqlls = require("wobuz.plugins.lsp.sql"),
                rust_analyzer = require("wobuz.plugins.lsp.rust")
            }
            local lspconfig = require "lspconfig"
            local lsp = require("wobuz.plugins.lsp.lsp")
            for name, config in pairs(servers) do
                config.on_setup(lspconfig[name], lsp)
            end
        end
    }
}
