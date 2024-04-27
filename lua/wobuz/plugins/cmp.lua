return {
    -- nvim-cmp
    "hrsh7th/nvim-cmp", -- The completion plugin
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip',
        'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', "onsails/lspkind.nvim"
    },
    config = function()
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then return end
        cmp.setup {
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),

                ["<CR>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                },

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                            "<Plug>luasnip-expand-or-jump",
                                            true, true, true), "")
                    else
                        fallback()
                    end
                end, {"i", "s"}),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                            "<Plug>luasnip-jump-prev", true,
                                            true, true), "")
                    else
                        fallback()
                    end
                end, {"i", "s"})
            },
            sources = {
                {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"},
                {name = "nvim_lua"}, {name = "path"}
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()

            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            experimental = {ghost_text = false, native_menu = false}
        }
    end
}
