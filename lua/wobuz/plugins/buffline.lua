return {
    'akinsho/bufferline.nvim',
    version = "*",
    -- event = "User FileOpened",
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        local status_ok, bufferline = pcall(require, "bufferline")
        if not status_ok then return end
        bufferline.setup {
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                -- style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
                themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
                numbers = "ordinal",
                close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
                right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
                left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
                middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'icon'
                },
                buffer_close_icon = '󰅖',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or ""
                    return " " .. icon .. count
                end,
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                truncate_names = true, -- whether or not tab names should be truncated
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                offsets = {
                    {
                        filetype = "undotree",
                        text = "Undotree",
                        highlight = "PanelHeading",
                        padding = 1
                    }, {
                        filetype = "NvimTree",
                        text = "Explorer",
                        highlight = "PanelHeading",
                        padding = 1
                    }, {
                        filetype = "DiffviewFiles",
                        text = "Diff View",
                        highlight = "PanelHeading",
                        padding = 1
                    }, {
                        filetype = "flutterToolsOutline",
                        text = "Flutter Outline",
                        highlight = "PanelHeading"
                    },
                    {
                        filetype = "lazy",
                        text = "Lazy",
                        highlight = "PanelHeading",
                        padding = 1
                    }
                },
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
                duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                move_wraps_at_ends = true, -- whether or not the move command "wraps" at the first or last position
                -- "slant": 表示斜线样式的分隔符，通常是斜线形状的。
                -- "slope": 表示斜坡样式的分隔符，可能比 "slant" 更平缓一些。
                -- "thick": 表示较粗的分隔符样式，可能具有更宽的线条。
                -- "thin": 表示较细的分隔符样式，通常具有较细的线条。
                separator_style = {"thin"},
                enforce_regular_tabs = true,
                always_show_bufferline = true,
                auto_toggle_bufferline = true
            }
        }
    end
}
