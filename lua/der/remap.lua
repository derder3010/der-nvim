vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader><space>", vim.cmd.Ex)
vim.cmd([[nnoremap \ :Ex<cr>]])
vim.keymap.set("n", "<leader><space>", "<cmd>Neotree reveal<cr>")
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>")
-- vim.keymap.set('n', '<leader>/', function()
--     vim.cmd('normal gcc')
-- end)

-- For visual mode
vim.keymap.set('v', '<leader>/', function()
    vim.cmd('normal gc')
end)

-- vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics<cr>")
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>")

vim.keymap.set("n", "<leader>u", "<cmd>LspInstall<cr>")
-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree position=left<cr>")
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = false })


-- tab navigation
-- Chuyển sang tab tiếp theo
vim.keymap.set("n", "<tab>", '<cmd>BufferLineCycleNext<CR>')

-- Chuyển sang tab trước đó
-- vim.keymap.set('n', '<C-S-Tab>', '<cmd>bwind<CR>', { noremap = true, silent = true })
-- Đóng tab hiện tại
vim.keymap.set("n", "<C-w>", '<cmd>bdelete<CR>')
vim.keymap.set("n", "<leader>A", '<cmd>SupermavenRestart<CR>')
vim.keymap.set("n", "<leader>S", '<cmd>SupermavenRestop<CR>')

