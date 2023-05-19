return {
    "nvim-tree/nvim-tree.lua",
    version = "nightly",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup {
            update_focused_file = {enable = true, update_cwd = true},
            renderer = {
                root_folder_modifier = ":t",
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
            }
        }
    end
}
