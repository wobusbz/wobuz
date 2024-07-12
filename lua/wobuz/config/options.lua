local options = {
    backup = false,                          -- 创建备份文件
    clipboard = "unnamedplus",               -- 允许 Neovim 访问系统剪贴板
    cmdheight = 2,                           -- 在 Neovim 命令行中为显示消息提供更多空间
    completeopt = { "menuone", "noselect" }, -- 主要用于 cmp
    conceallevel = 0,                        -- 以便在 Markdown 文件中可见 ``
    fileencoding = "utf-8",                  -- 写入文件的编码
    hlsearch = true,                         -- 突出显示之前搜索模式的所有匹配项
    ignorecase = true,                       -- 在搜索模式中忽略大小写
    mouse = "a",                             -- 允许在 Neovim 中使用鼠标
    pumheight = 10,                          -- 弹出菜单高度
    showmode = false,                        -- 我们不再需要看到诸如 -- INSERT -- 之类的内容
    showtabline = 2,                         -- 始终显示标签
    smartcase = true,                        -- 智能大小写
    smartindent = true,                      -- 再次使缩进更智能
    splitbelow = true,                       -- 强制所有水平分割在当前窗口下方
    splitright = true,                       -- 强制所有垂直分割在当前窗口右侧
    swapfile = false,                        -- 创建交换文件
    termguicolors = true,                    -- 设置终端图形颜色（大多数终端支持）
    timeoutlen = 400,                        -- 等待映射序列完成的时间（以毫秒为单位）
    timeout = true,
    undofile = true,                         -- 启用持久撤销
    updatetime = 300,                        -- 更快完成（默认 4000 毫秒）
    writebackup = false,                     -- 如果文件正在被其他程序编辑（或在使用其他程序编辑时已写入文件），则不允许编辑
    expandtab = true,                        -- 将制表符转换为空格
    shiftwidth = 4,                          -- 每次缩进插入的空格数
    tabstop = 4,                             -- 插入 2 个空格作为一个制表符
    cursorline = true,                       -- 突出显示当前行
    number = true,                           -- 设置行号
    relativenumber = true,                   -- 设置相对行号
    numberwidth = 4,                         -- 将行号列宽度设置为 2（默认 4）
    signcolumn = "yes",                      -- 始终显示符号列，否则每次都会移动文本
    wrap = false,                            -- 将行显示为一条长线
    linebreak = true,                        -- 与 wrap 配合使用，不拆分单词
    scrolloff = 8,                           -- 保持在光标上方和下方的最小屏幕行数
    sidescrolloff = 8,                       -- 如果 wrap 为 false，则在光标两侧的最小屏幕列数
    whichwrap = "bs<>[]hl"                   -- 哪些“水平”键允许移动到上一行/下一行
}

for k, v in pairs(options) do vim.opt[k] = v end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.guifont = "Menlo:h20" -- the font used in graphical neovim applications

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated',
    { bg = 'NONE', strikethrough = true, fg = '#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
    callback = function() vim.diagnostic.open_float(nil, { focus = false }) end
})
