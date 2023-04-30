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
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
            "nvim-telescope/telescope-dap.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-treesitter/nvim-treesitter-context",
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
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd.MasonUpdate)
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
    {
        "mfussenegger/nvim-dap",
        opt = {},
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            -- "leoluz/nvim-dap-go",
            "jbyuki/one-small-step-for-vimkind",
            "mxsdev/nvim-dap-vscode-js",
            {
                "microsoft/vscode-js-debug",
                opt = {},
                build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
            },
        },
        config = function()
            require("config.dap").setup()
        end,
        enabled = true,
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
    { 'vimwiki/vimwiki' },
    { 'github/copilot.vim' },
}
