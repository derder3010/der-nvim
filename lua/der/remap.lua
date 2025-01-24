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




-- local function wrap_mode(mode)
--     vim.keymap.set(mode, '<Left>', function()
--         local col = vim.fn.col('.')
--         local line = vim.fn.getline('.')
--         if col == 1 and vim.fn.line('.') > 1 then
--             return mode == 'n' and 'k$' or mode == 'i' and '<C-o>k<C-o>$' or 'k$'
--         elseif mode == 'i' and col > 1 and line:sub(col - 1, col - 1):match('[(%[{]') then
--             return '<Left>'
--         else
--             return mode == 'n' and 'h' or mode == 'i' and '<Left>' or 'h'
--         end
--     end, { expr = true, silent = true })
--
--     vim.keymap.set(mode, '<Right>', function()
--         local col = vim.fn.col('.')
--         local line = vim.fn.getline('.')
--         local last_col = vim.fn.col('$') - 1
--         if col == last_col and vim.fn.line('.') < vim.fn.line('$') then
--             return mode == 'n' and 'j0' or mode == 'i' and '<C-o>j<C-o>0' or 'j0'
--         elseif mode == 'i' and col < #line and line:sub(col + 1, col + 1):match('[)%]};]') then
--             return '<Right>'
--         else
--             return mode == 'n' and 'l' or mode == 'i' and '<Right>' or 'l'
--         end
--     end, { expr = true, silent = true })
-- end
--
-- wrap_mode('n') -- Normal mode
-- wrap_mode('v') -- Visual mode
-- wrap_mode('i') -- Insert mode


local function at_line_start()
    return vim.fn.col('.') == 1 and vim.fn.line('.') > 1
end

local function at_line_end()
    return vim.fn.col('.') >= vim.fn.col('$') - 1 and vim.fn.line('.') < vim.fn.line('$')
end

-- Insert Mode: Improved <Left> and <Right> to work with auto-pairs
vim.keymap.set('i', '<Left>', function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.fn.col('.') -- 1-based column

    -- If inside a closing pair (e.g., `|)`), move left into the pair
    if col > 1 then
        local prev_char = line:sub(col - 1, col - 1)
        local next_char = line:sub(col, col)
        -- Check if cursor is between a closing pair (e.g., "()", "[]")
        if (prev_char == '(' and next_char == ')') or
            (prev_char == '[' and next_char == ']') or
            (prev_char == '{' and next_char == '}') then
            return '<Left>'
        end
    end

    -- Otherwise, check if at line start and jump to previous line
    return at_line_start() and '<C-o>k<C-o>$' or '<Left>'
end, { expr = true, noremap = true })

vim.keymap.set('i', '<Right>', function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.fn.col('.') -- 1-based column

    -- If inside a closing pair (e.g., `(|)`), move right out of the pair
    if col <= #line then
        local next_char = line:sub(col, col)
        if next_char:match('[%)%]%}]') then
            return '<Right>'
        end
    end

    -- Otherwise, check if at line end and jump to next line
    return at_line_end() and '<C-o>j<C-o>0' or '<Right>'
end, { expr = true, noremap = true })
