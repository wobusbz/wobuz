return {
    "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",
    event = "User FileOpened",
    cmd = {
        "TSInstall", "TSUninstall", "TSUpdate", "TSUpdateSync", "TSInstallInfo",
        "TSInstallSync", "TSInstallFromGrammar"
    },
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {"c", "go", "rust"},
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat,
                                            vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false
            }
        }
    end
}
