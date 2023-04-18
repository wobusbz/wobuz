local status, nvimtree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
    return
end

local defaultStatus, default = pcall(require, "wobuz.core.defauls")
if not defaultStatus then
    vim.notify("core.defaults not found")
    return
end

nvimtree.setup({
    sort_by = "case_sensitive",
    auto_reload_on_write = false,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    on_attach = "disable",
    remove_keymaps = false,
    select_prompts = false,
    view = {
        width = 30,
        mappings = {
            list = {
                {key = {"o", "<2-LeftMouse>"}, action = "edit"},
                -- {key = "<CR>", action = "system_open"}, -- v分屏打开文件
                {key = "v", action = "vsplit"}, -- h分屏打开文件
                {key = "h", action = "split"}, -- Ignore (node_modules)
                {key = "i", action = "toggle_ignored"}, -- Hide (dotfiles)
                {key = ".", action = "toggle_dotfiles"},
                {key = "R", action = "refresh"},
                {key = "h", action = "close_node"},
                {key = "v", action = "vsplit"}, {key = "C", action = "cd"},
                {key = "a", action = "create"}, {key = "d", action = "remove"},
                {key = "r", action = "rename"}, {key = "x", action = "cut"},
                {key = "c", action = "copy"}, {key = "p", action = "paste"},
                {key = "y", action = "copy_name"},
                {key = "Y", action = "copy_path"},
                {key = "gy", action = "copy_absolute_path"},
                {key = "I", action = "toggle_file_info"},
                {key = "n", action = "tabnew"}
            }
        },
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1
            }
        }
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_label = ":t",
        indent_width = 2,
        indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {corner = "└", edge = "│", item = "│", none = " "}
        },
        icons = {
            webdev_colors = default.use_icons,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = default.use_icons,
                folder = default.use_icons,
                folder_arrow = default.use_icons,
                git = default.use_icons
            },
            glyphs = {
                default = default.icons.ui.Text,
                symlink = default.icons.ui.FileSymlink,
                bookmark = default.icons.ui.BookMark,
                folder = {
                    arrow_closed = default.icons.ui.TriangleShortArrowRight,
                    arrow_open = default.icons.ui.TriangleShortArrowDown,
                    default = default.icons.ui.Folder,
                    open = default.icons.ui.FolderOpen,
                    empty = default.icons.ui.EmptyFolder,
                    empty_open = default.icons.ui.EmptyFolderOpen,
                    symlink = default.icons.ui.FolderSymlink,
                    symlink_open = default.icons.ui.FolderOpen
                },
                git = {
                    unstaged = default.icons.git.FileUnstaged,
                    staged = default.icons.git.FileStaged,
                    unmerged = default.icons.git.FileUnmerged,
                    renamed = default.icons.git.FileRenamed,
                    untracked = default.icons.git.FileUntracked,
                    deleted = default.icons.git.FileDeleted,
                    ignored = default.icons.git.FileIgnored
                }
            }
        },
        special_files = {"Cargo.toml", "Makefile", "README.md", "readme.md"},
        symlink_destination = true
    },
    hijack_directories = {enable = false, auto_open = true},
    update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
        ignore_list = {}
    },
    diagnostics = {
        enable = default.use_icons,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR
        },
        icons = {
            hint = default.icons.diagnostics.BoldHint,
            info = default.icons.diagnostics.BoldInformation,
            warning = default.icons.diagnostics.BoldWarning,
            error = default.icons.diagnostics.BoldError
        }
    },
    filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {"node_modules", "\\.cache"},
        exclude = {}
    },
    filesystem_watchers = {enable = true, debounce_delay = 50, ignore_dirs = {}},
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 200
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {enable = true, global = false, restrict_above_cwd = false},
        expand_all = {max_folder_discovery = 300, exclude = {}},
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = "cursor",
                border = "shadow",
                style = "minimal"
            }
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                picker = "default",
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {
                        "notify", "lazy", "qf", "diff", "fugitive",
                        "fugitiveblame"
                    },
                    buftype = {"nofile", "terminal", "help"}
                }
            }
        },
        remove_file = {close_window = true}
    },
    trash = {cmd = "trash", require_confirm = true},
    live_filter = {prefix = "[FILTER]: ", always_show_folders = true},
    tab = {sync = {open = false, close = false, ignore = {}}},
    notify = {threshold = vim.log.levels.INFO},
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false
        }
    },
    system_open = {cmd = nil, args = {}}
})

