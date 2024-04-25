return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {'nvim-lua/plenary.nvim'},
    event = "VeryLazy",
    cmd = "Telescope",
    config = function()
        local status, telecope = pcall(require, 'telescope')
        if not status then
            vim.notify("telescope not found")
            return
        end
        local actions = require("telescope.actions")
        telecope.setup {
            defaults = {
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = nil,
                layout_strategy = nil,
                layout_config = {},
                vimgrep_arguments = {
                    "rg", "--color=never", "--no-heading", "--with-filename",
                    "--line-number", "--column", "--smart-case", "--hidden",
                    "--glob=!.git/"
                },
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                        ["<C-q>"] = function(...)
                            actions.smart_send_to_qflist(...)
                            actions.open_qflist(...)
                        end,
                        ["<CR>"] = actions.select_default
                    },
                    n = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = function(...)
                            actions.smart_send_to_qflist(...)
                            actions.open_qflist(...)
                        end
                    }
                }
            },
            pickers = {
                live_grep = {only_sort_text = true},
                grep_string = {only_sort_text = true},
                planets = {show_pluto = true, show_moon = true},
                git_files = {hidden = false, show_untracked = true},
                colorscheme = {enable_preview = true}
            },
            extensions = {}
        }
    end
}
