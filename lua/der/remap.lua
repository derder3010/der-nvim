vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader><space>", vim.cmd.Ex)
-- vim.cmd([[nnoremap \ :Ex<cr>]])
vim.keymap.set("n", "<leader><space>", "<cmd>Neotree bottom<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>Neotree left<cr>")
vim.cmd([[nnoremap  \ :Neotree current<cr>]])
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
vim.keymap.set("n", "<leader>t", ":botright 15split | terminal ")
-- vim.keymap.set("n", "<leader>T", "<cmd>ToggleTerm<cr>")

-- vim.keymap.set('n', '<leader>g', function()
--     builtin.grep_string({ search = vim.fn.input( "Grep > ") });
-- end)

vim.keymap.set("n", "<leader>u", "<cmd>LspInstall<cr>")
-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree position=left<cr>")
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = false })


-- tab navigation
-- Chuyển sang tab tiếp theo
vim.keymap.set("n", "<tab>", '<cmd>BufferLineCycleNext<CR>')

-- Chuyển sang tab trước đó
-- vim.keymap.set('n', '<C-S-Tab>', '<cmd>bwind<CR>', { noremap = true, silent = true })
-- Đóng tab hiện tại
-- vim.keymap.set("n", "<C-w>", '<cmd>bdelete<CR>')
vim.keymap.set("n", "<C-w>", function()
    Snacks.bufdelete()
end)
vim.keymap.set("n", "<leader>A", '<cmd>SupermavenRestart<CR>')
vim.keymap.set("n", "<leader>S", '<cmd>SupermavenRestop<CR>')

vim.keymap.set("n", "<leader>n", '<cmd>Noice history<CR>')
vim.keymap.set("n", "<leader>q", '<cmd>copen<CR>')


vim.g.VM_maps = {
    ['Find Under'] = '<C-d>',         -- Thay thế cho Ctrl-n
    ['Find Subword Under'] = '<C-d>', -- Thay thế cho visual Ctrl-n
}

-- vim.keymap.set("n", "<leader>d" ,'<Cmd>lua require("dapui").open()<CR>')

vim.keymap.set("n", "<leader>h", '<cmd>split<CR>')
vim.keymap.set("n", "<leader>v", '<cmd>vsplit<CR>')
-- Di chuyển giữa các split panels bằng Ctrl + h/j/k/l
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to the left split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to the below split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to the above split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to the right split' })

vim.keymap.set('v', '<Tab>', '>')
vim.keymap.set('v', '<S-Tab>', '<')


-- Resize splits using Ctrl + Arrow Keys
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize split up' })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize split down' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Resize split left' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Resize split right' })


-- Smart left arrow (wrap to previous line)
vim.keymap.set({ 'n', 'v', 'i' }, '<Left>', function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor[1], cursor[2]

    if col == 0 and row > 1 then
        local prev_line = vim.api.nvim_buf_get_lines(0, row - 2, row - 1, true)[1] or ""
        local prev_line_end = math.max(0, #prev_line - 1) -- Corrected end position
        vim.api.nvim_win_set_cursor(0, { row - 1, prev_line_end })
    else
        vim.api.nvim_win_set_cursor(0, { row, math.max(col - 1, 0) })
    end
end, { noremap = true, silent = true })

-- Smart right arrow (wrap to next line)
vim.keymap.set({ 'n', 'v', 'i' }, '<Right>', function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor[1], cursor[2]
    local current_line = vim.api.nvim_buf_get_lines(0, row - 1, row, true)[1] or ""
    local line_end = math.max(0, #current_line - 1) -- Corrected end position

    if col >= line_end and row < vim.api.nvim_buf_line_count(0) then
        vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    else
        vim.api.nvim_win_set_cursor(0, { row, math.min(col + 1, line_end) })
    end
end, { noremap = true, silent = true })
