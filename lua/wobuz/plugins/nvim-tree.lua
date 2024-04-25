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
            update_focused_file = {
                enable = true,
                update_cwd = true,
                ignore_list = {"help"}
            },
            renderer = {
                root_folder_modifier = ":t",
                full_name = true,
                group_empty = true,
                special_files = {},
                symlink_destination = false,
                indent_markers = {enable = true},
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = ""
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
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
            view = {
                width = 30,
                side = "left",
                mappings = {
                    list = {
                        {key = {"o", "<2-LeftMouse>"}, action = "edit"},
                        {key = "v", action = "vsplit"}, -- h分屏打开文件
                        {key = "h", action = "split"}, -- Ignore (node_modules)
                        {key = "i", action = "toggle_ignored"}, -- Hide (dotfiles)
                        {key = ".", action = "toggle_dotfiles"},
                        {key = "R", action = "refresh"},
                        {key = "h", action = "close_node"},
                        {key = "v", action = "vsplit"},
                        {key = "C", action = "cd"},
                        {key = "a", action = "create"},
                        {key = "d", action = "remove"},
                        {key = "r", action = "rename"},
                        {key = "x", action = "cut"},
                        {key = "c", action = "copy"},
                        {key = "p", action = "paste"},
                        {key = "y", action = "copy_name"},
                        {key = "Y", action = "copy_path"},
                        {key = "gy", action = "copy_absolute_path"},
                        {key = "I", action = "toggle_file_info"},
                        {key = "n", action = "tabnew"}
                    }
                }
            },
            actions = {
                change_dir = {enable = false, restrict_above_cwd = true},
                open_file = {
                    resize_window = true,
                    window_picker = {chars = "aoeui"}
                },
                remove_file = {close_window = false}
            },
            filters = {custom = {"^.git$", "^.vscode"}}
        }
    end
}
