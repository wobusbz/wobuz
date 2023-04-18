local status, telecope = pcall(require, 'telescope')
if not status then
    vim.notify("telescope not found")
    return
end

local actions = require("telescope.actions")
local default = require("wobuz.core.defauls")

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
        -- Default configuration for telescope goes here:
        -- config_key = value,
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
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-q>"] = function(...)
                    actions.smart_send_to_qflist(...)
                    actions.open_qflist(...)
                end
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {hidden = true},
        live_grep = {
            -- @usage don't include the filename in the search results
            only_sort_text = true
        },
        grep_string = {only_sort_text = true},
        buffers = {
            initial_mode = "normal",
            mappings = {
                i = {["<C-d>"] = actions.delete_buffer},
                n = {["dd"] = actions.delete_buffer}
            }
        },
        planets = {show_pluto = true, show_moon = true},
        git_files = {hidden = true, show_untracked = true},
        colorscheme = {enable_preview = true}
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        }
    }
}

telecope.load_extension('fzf')
