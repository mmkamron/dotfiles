return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end,
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
            "ThePrimeagen/git-worktree.nvim",
        },
        config = function() require("telescope").load_extension("git_worktree") end,
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
            { 'leoluz/nvim-dap-go',              opts = {} }
        },
        config = function()
            require "plugins.configs.dap"
        end
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
    { 'tpope/vim-fugitive' },
}
