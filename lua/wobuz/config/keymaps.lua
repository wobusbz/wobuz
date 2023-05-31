local generic_opts_any = {noremap = true, silent = true}

local generic_opts = {
    insert_mode = generic_opts_any,
    normal_mode = generic_opts_any,
    visual_mode = generic_opts_any,
    visual_block_mode = generic_opts_any,
    command_mode = generic_opts_any,
    operator_pending_mode = generic_opts_any,
    term_mode = {silent = true}
}

local mode_adapters = {
    insert_mode = "i",
    normal_mode = "n",
    term_mode = "t",
    visual_mode = "v",
    visual_block_mode = "x",
    command_mode = "c",
    operator_pending_mode = "o"
}

local defaults = {
    insert_mode = {
        ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
        ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
        -- navigation
        ["<A-Up>"] = "<C-\\><C-N><C-w>k",
        ["<A-Down>"] = "<C-\\><C-N><C-w>j",
        ["<A-Left>"] = "<C-\\><C-N><C-w>h",
        ["<A-Right>"] = "<C-\\><C-N><C-w>l",
        ["<C-s>"] = "<Esc>:w<CR>",
        ["<leader>ff"] = "<cmd>Telescope find_files<cr>",
        ["<leader>fl"] = "<cmd>Telescope live_grep<cr>",
        ["<leader>fg"] = "<cmd>Telescope grep_string<cr>",
        ["<leader>fb"] = "<cmd>Telescope buffers<cr>",
        ["<leader>fh"] = "<cmd>Telescope help_tags<cr>",
        ["<C-q>"] = ":wqa<cr>",
        ["<C-l>"] = "<Right>",
        ["<C-h>"] = "<Left>"
    },
    normal_mode = {
        -- Better window movement
        ["<C-h>"] = "<C-w>h",
        ["<C-j>"] = "<C-w>j",
        ["<C-k>"] = "<C-w>k",
        ["<C-l>"] = "<C-w>l",
        -- Resize with arrows
        ["<C-Up>"] = ":resize -2<CR>",
        ["<C-Down>"] = ":resize +2<CR>",
        ["<C-Left>"] = ":vertical resize -2<CR>",
        ["<C-Right>"] = ":vertical resize +2<CR>",
        -- Move current line / block with Alt-j/k a la vscode.
        ["<A-j>"] = ":m .+1<CR>==",
        ["<A-k>"] = ":m .-2<CR>==",
        -- QuickFix
        ["]q"] = ":cnext<CR>",
        ["[q"] = ":cprev<CR>",
        --        ["<C-q>"] = ":call QuickFixToggle()<CR>",

        -- nvim-tree
        ["<leader>e"] = "<cmd>NvimTreeToggle<CR>",
        ["<S-h>"] = "<cmd>BufferLineCyclePrev<cr>",
        ["<S-l>"] = "<cmd>BufferLineCycleNext<cr>",
        ["<leader>h"] = "<cmd>BufferLineCloseLeft<cr>",
        ["<leader>l"] = "<cmd>BufferLineCloseRight<cr>",
        ["<C-s>"] = "<Esc>:w<CR>",
        -- telescope
        ["<leader>p"] = "<cmd>Telescope find_files<cr>",
        ["<leader>f"] = "<cmd>Telescope live_grep<cr>",
        ["<leader>s"] = "<cmd>Telescope grep_string<cr>",
        ["<leader>fb"] = "<cmd>Telescope buffers<cr>",
        ["<leader>fh"] = "<cmd>Telescope help_tags<cr>",
        -- git
        ["<leader>gl"] = "<cmd>lua require 'gitsigns'.blame_line()<cr>",
        -- lspsaga
        ["<leader>g"] = "<cmd>Lspsaga lsp_finder<CR>",
        ["<leader>c"] = "<cmd>Lspsaga code_action<cr>",
        ["<leader>v"] = "<cmd>Lspsaga hover_doc<CR>",
        ["<leader>r"] = "<cmd>Lspsaga rename<cr>",
        ["<leader>d"] = "ddkk<cr>",
        ["<Esc>"] = "<cmd>nohl<cr>",

        ["gd"] = "<cmd>lua vim.lsp.buf.definition()<cr>",
        ["gD"] = "<cmd>lua vim.lsp.buf.declaration()<cr>",
        ["gr"] = "<cmd>lua vim.lsp.buf.references()<cr>",
        ["gs"] = "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        ["<leader>w"] = "<cmd>Lspsaga hover_doc ++keep<CR>"
    },
    term_mode = {
        -- Terminal window navigation
        ["<C-h>"] = "<C-\\><C-N><C-w>h",
        ["<C-j>"] = "<C-\\><C-N><C-w>j",
        ["<C-k>"] = "<C-\\><C-N><C-w>k",
        ["<C-l>"] = "<C-\\><C-N><C-w>l"
    },
    visual_mode = {
        -- Better indenting
        ["<"] = "<gv",
        [">"] = ">gv",
        ["<leader>ca"] = "<cmd>Lspsaga code_action<CR>"
        -- ["p"] = '"0p',
        -- ["P"] = '"0P',
    },
    visual_block_mode = {
        -- Move current line / block with Alt-j/k ala vscode.
        ["<A-j>"] = ":m '>+1<CR>gv-gv",
        ["<A-k>"] = ":m '<-2<CR>gv-gv"
    },
    command_mode = {
        -- navigate tab completion with <c-j> and <c-k>
        -- runs conditionally
        ["<C-j>"] = {
            'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
            {expr = true, noremap = true}
        },
        ["<C-k>"] = {
            'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
            {expr = true, noremap = true}
        }
    }
}

if vim.fn.has "mac" == 1 then
    defaults.normal_mode["<A-Up>"] = defaults.normal_mode["<C-Up>"]
    defaults.normal_mode["<A-Down>"] = defaults.normal_mode["<C-Down>"]
    defaults.normal_mode["<A-Left>"] = defaults.normal_mode["<C-Left>"]
    defaults.normal_mode["<A-Right>"] = defaults.normal_mode["<C-Right>"]
end

local keymaps = defaults or {}
for mode, mappings in pairs(keymaps) do
    mode = mode_adapters[mode] or mode
    for key, val in pairs(mappings) do
        local opt = generic_opts[mode] or generic_opts_any
        if type(val) == "table" then
            opt = val[2]
            val = val[1]
        end
        if val then
            vim.keymap.set(mode, key, val, opt)
        else
            pcall(vim.api.nvim_del_keymap, mode, key)
        end
    end
end
