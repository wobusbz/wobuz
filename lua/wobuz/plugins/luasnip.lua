return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
        -- vscode format
        require("luasnip.loaders.from_vscode").lazy_load {
            exclude = vim.g.vscode_snippets_exclude or {}
        }
        require("luasnip.loaders.from_vscode").lazy_load {paths = "your path!"}
        require("luasnip.loaders.from_vscode").lazy_load {
            paths = vim.g.vscode_snippets_path or ""
        }

        -- snipmate format
        require("luasnip.loaders.from_snipmate").load()
        require("luasnip.loaders.from_snipmate").lazy_load {
            paths = vim.g.snipmate_snippets_path or ""
        }

        -- lua format
        require("luasnip.loaders.from_lua").load()
        require("luasnip.loaders.from_lua").lazy_load {
            paths = vim.g.lua_snippets_path or ""
        }
        require("luasnip").setup({
            update_events = {"TextChanged", "TextChangedI"}
        })

        vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
                if require("luasnip").session.current_nodes[vim.api
                    .nvim_get_current_buf()] and
                    not require("luasnip").session.jump_active then
                    require("luasnip").unlink_current()
                end
            end
        })
    end
}
