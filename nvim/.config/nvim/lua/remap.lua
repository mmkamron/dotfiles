vim.g.vimwiki_list = { { path = '/home/arch/Sync/Documents/vimwiki' } }
vim.opt.guicursor = "i:block"
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "Q", 'gqgq')
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>v", function() require("nvterm.terminal").new "horizontal" end, {})
vim.keymap.set("n", "<leader>c", '<cmd>!compiler "%:p"<CR>', {})
vim.keymap.set("n", "cd", '<cmd>cd %:p:h<CR>', {})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- dap
vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F9>", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>rg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fn', function() builtin.find_files({ cwd = "~/.config/nvim/" }) end, {})

local ui = require('harpoon.ui')
vim.keymap.set('n', '<leader>a', require("harpoon.mark").add_file, {})
vim.keymap.set('n', '<C-M>', ui.toggle_quick_menu, {})
vim.keymap.set('n', '<C-K>', ui.nav_next, {})
vim.keymap.set('n', '<C-J>', ui.nav_prev, {})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
