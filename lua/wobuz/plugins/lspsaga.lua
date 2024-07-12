return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" }, { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
        require('lspsaga').setup({
            ui = {
                border = 'single',
                devicon = true,
                title = true,
                expand = '⊞',
                collapse = '⊟',
                --code_action = '💡',
                actionfix = ' ',
                lines = { '┗', '┣', '┃', '━', '┏' },
                kind = {},
                imp_sign = '󰳛 '
            },
            diagnostic = {
                show_code_action = true,
                show_source = true,
                jump_num_shortcut = true,
                max_width = 0.7,
                custom_fix = nil,
                custom_msg = nil,
                text_hl_follow = false,
                keys = { exec_action = 'o', quit = 'q', go_action = 'g' }
            },
            code_action = {
                num_shortcut = true,
                keys = { quit = 'q', exec = '<CR>' }
            },
            lightbulb = {
                enable = true,
                enable_in_insert = true,
                -- cache_code_action = true,
                sign = true,
                sign_priority = 40,
                virtual_text = false
            },
            preview = { lines_above = 0, lines_below = 10 },
            scroll_preview = { scroll_down = '<C-f>', scroll_up = '<C-b>' },
            request_timeout = 2000,
            beacon = { enable = true, frequency = 7 },
            server_filetype_map = {}
        })
    end
}
