return {
    {
        'rose-pine/neovim',
        priority = 1000,
        name = "rose-pine",
        opts = function()
            vim.cmd.colorscheme "rose-pine"
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = function()
            return require "plugins.configs.treesitter"
        end,
    },
    {
        'vimwiki/vimwiki',
        init = function()
            vim.g.vimwiki_list = { { path = '~/Documents/vimwiki', syntax = 'markdown', ext = '.md' } }
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require "plugins.configs.lsp"
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter-context",
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {},
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    {
        "mfussenegger/nvim-dap",
        ft = "go",
        dependencies = {
            { 'theHamsta/nvim-dap-virtual-text', opts = {} },
            { 'leoluz/nvim-dap-go', opts = {} }
        }
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = "go",
        opts = function() return require "plugins.configs.null-ls" end
    },
    { "windwp/nvim-autopairs", opts = {} },
    { "ThePrimeagen/harpoon" },
    { 'numToStr/Comment.nvim', opts = {} },
    { 'NvChad/nvterm',         opts = {} },
    { 'github/copilot.vim' },
    { 'sindrets/diffview.nvim' },
}
