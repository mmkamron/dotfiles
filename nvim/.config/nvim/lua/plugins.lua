return {
    {
        'rose-pine/neovim',
        lazy = false,
        priority = 1000,
        name = 'rose-pine',
        config = function()
            vim.cmd.colorscheme "rose-pine"
        end
    },
    {
        'vimwiki/vimwiki',
        init = function()
            vim.g.vimwiki_list = { { path = '~/Documents/vimwiki', syntax = 'markdown', ext = '.md' } }
        end
    },
    { 'neovim/nvim-lspconfig' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
            "nvim-treesitter/nvim-treesitter-context",
            "jose-elias-alvarez/null-ls.nvim"
        }
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
    { "windwp/nvim-autopairs", opts = {} },
    { "ThePrimeagen/harpoon" },
    { "Pocco81/auto-save.nvim" },
    { 'numToStr/Comment.nvim', opts = {} },
    { 'NvChad/nvterm',         opts = {} },
    { 'github/copilot.vim' },
    { 'sindrets/diffview.nvim' }
}
