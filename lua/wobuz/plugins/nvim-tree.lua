return {
    "nvim-tree/nvim-tree.lua",
    tag = "nightly",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    event = "User DirOpened",
    cmd = {
        "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus",
        "NvimTreeFindFileToggle"
    },
    config = function()
        local nvim_tree = require("nvim-tree");
        nvim_tree.setup {
            renderer = {
                root_folder_modifier = ":t",
                root_folder_label = ":~:s?$?/..?",
                highlight_git = true,
                highlight_opened_files = "none",
                indent_markers = {enable = true},
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        bookmark = "󰆤",
                        modified = "●",
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = ""
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌"
                        }
                    }
                }
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = ""
                }
            },
            filters = {dotfiles = false},
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = false,
            sync_root_with_cwd = true,
            update_focused_file = {enable = true, update_root = false},
            view = {
                adaptive_size = false,
                side = "left",
                width = 30,
                preserve_window_proportions = true
            },
            git = {enable = true, ignore = true},
            filesystem_watchers = {enable = true},
            actions = {open_file = {resize_window = true}}
        }
    end
}
