vim.g.mapleader = " "
vim.keymap.set("n", "<leader><space>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
vim.keymap.set('n', '<leader>/', function()
    vim.cmd('normal gcc')
end)

-- For visual mode
vim.keymap.set('v', '<leader>/', function()
    vim.cmd('normal gc')
end)

vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics<cr>")

vim.keymap.set("n", "<leader>u", "<cmd>LspInstall<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")
