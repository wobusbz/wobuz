local status, cmp = pcall(require, 'cmp')
if not status then
    vim.notify("cmp not found")
    return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    vim.notify("luasnip not found")
    return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    vim.notify("lspkind not found")
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-b>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- ["<C-f>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- ["<C-d>"] = cmp.mapping(function()
        --     cmp.close()
        -- end, { "i", "s" }),
        ['<C-d>'] = cmp.mapping(function(fallback)
            -- cmp.close()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
                -- if luasnip.jumpable(1) then
                --   luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<C-f>'] = cmp.mapping(function(fallback)
            -- cmp.close()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<CR>'] = cmp.mapping.confirm({
            -- ConfirmBehavior: Insert & Replace
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
            -- cmp.close()
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    }),
    sources = cmp.config.sources({
        {name = "nvim_lsp"}, {name = "nvim_lsp_signature_help"},
        {name = "vsnip"}, {name = "buffer"}
    }, {{name = "path"}}),
    formatting = {
        format = lspkind.cmp_format({maxwidth = 50, ellipsis_char = "..."})
    }
})
