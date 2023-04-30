local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup("plugins")

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "go", "javascript", "lua", "markdown" },
    highlight = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
    indent = {
        enable = true
    }
}

local lsp = require('lsp-zero').preset({
    manage_nvim_cmp = {
        set_sources = 'recommended'
    }
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require("telescope").load_extension "file_browser"

lsp.setup()

require('set')
require('remap')
