-- require('fidget').setup()
--
-- --- Override các hàm thông báo lỗi mặc định
-- local original_error = vim.api.nvim_err_writeln
-- vim.api.nvim_err_writeln = function(msg)
--   vim.notify(msg, vim.log.levels.ERROR)
-- end
--
-- -- Override message handler
-- local original_msg = vim.api.nvim_echo
-- vim.api.nvim_echo = function(chunks, history, opts)
--   local msg = table.concat(vim.tbl_map(function(chunk)
--     return chunk[1]
--   end, chunks), "\n")
--
--   if msg:match("^E%d+:") then  -- Nếu là thông báo lỗi (bắt đầu bằng E...)
--     vim.notify(msg, vim.log.levels.ERROR)
--   else
--     original_msg(chunks, history, opts)
--   end
-- end
--
-- -- Tắt prompt "Press ENTER to continue"
-- vim.opt.shortmess:append('S')  -- Tắt search count message
-- vim.opt.shortmess:append('s')  -- Tắt search wrap message
-- -- vim.opt.cmdheight = 0         -- Ẩn command line khi không cần thiết
--
-- -- Hook vào command line để bắt các lỗi
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--   callback = function()
--     local cmdline = vim.fn.getcmdline()
--     -- Xử lý các command có thể gây lỗi
--     if cmdline:match("^s%s*$") then
--       -- Đã được xử lý bởi nvim_err_writeln override ở trên
--       return
--     end
--   end,
-- })
--
-- -- Tạo autocmd để bắt các thông báo write
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function()
--     local filename = vim.fn.expand('%:t')
--     vim.notify(string.format('"%s" written', filename), vim.log.levels.INFO)
--   end,
-- })
--
-- -- Tắt echom mặc định khi write file
-- vim.opt.shortmess:append('W')


-- vim.api.nvim_create_autocmd("BufWritePost", {
--     callback = function()
--         vim.lsp.diagnostic.set_loclist({ open_loclist = false })
--     end,
-- })

vim.api.nvim_create_autocmd("DiagnosticChanged", {
    callback = function()
        vim.diagnostic.setqflist({ open = false }) -- Đẩy lỗi vào QuickFix nhưng không mở cửa sổ
    end,
})

-- vim.g.rustaceanvim = {
--   -- Plugin configuration
--   tools = {
--   },
--   -- LSP configuration
--   server = {
--     on_attach = function(client, bufnr)
--       -- you can also put keymaps in here
--     end,
--     default_settings = {
--       -- rust-analyzer language server configuration
--       ['rust-analyzer'] = {
--       },
--     },
--   },
--   -- DAP configuration
--   dap = {
--   },
-- }


