local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("没有安装 packer.nvim")
    return
end

return packer.startup({
    function(use)
        use "wbthomason/packer.nvim" -- 包管理
        use {'nvim-tree/nvim-web-devicons'}
        use {"nvim-tree/nvim-tree.lua", tag = "nightly"}

        use 'Mofiqul/vscode.nvim' -- 主题
        use 'LunarVim/lunar.nvim' -- 主题
        use {"ellisonleao/gruvbox.nvim"}

        use {'akinsho/bufferline.nvim', tag = "v3.*"}
        use {'goolord/alpha-nvim'}
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        use 'numToStr/Comment.nvim' -- 注释插件

        use 'nvim-lualine/lualine.nvim' -- lualine 

        use 'nvim-lua/plenary.nvim'
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        use {'nvim-telescope/telescope.nvim', tag = '0.1.1'}

        -- 终端
        use "akinsho/toggleterm.nvim"

        -- git
        use 'lewis6991/gitsigns.nvim'

        -- autocompletion
        use("hrsh7th/nvim-cmp") -- completion plugin
        use("hrsh7th/cmp-buffer") -- source for text in buffer
        use("hrsh7th/cmp-path") -- source for file system paths

        -- snippets
        use("L3MON4D3/LuaSnip") -- snippet engine
        use("saadparwaiz1/cmp_luasnip") -- for autocompletion
        use("rafamadriz/friendly-snippets") -- useful snippets
        use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

        -- lsp
        use {"williamboman/mason.nvim"} -- :MasonUpdate updates registry contents
        use 'ray-x/go.nvim'
        use 'ray-x/guihua.lua' -- recommended if need floating window support
        use 'neovim/nvim-lspconfig'
        use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

        use({"glepnir/lspsaga.nvim", branch = "main"})
        use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
        use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }

    end,
    display = {
        -- 使用浮动窗口显示
        open_fn = function()
            return require("packer.util").float({border = "single"})
        end
    }
})

