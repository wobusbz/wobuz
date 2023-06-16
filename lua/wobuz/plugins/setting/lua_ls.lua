return {
    settings = {
        Lua = {
            telemetry = {enable = true},
            diagnostics = {
                -- 关闭警告信息
                globals = {'vim', 'packer_plugins'},
                disable = {'unused-local'}
            }
        }
    }
}
