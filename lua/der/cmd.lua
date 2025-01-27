vim.api.nvim_create_autocmd("DiagnosticChanged", {
    callback = function()
        vim.diagnostic.setqflist({ open = false }) -- Đẩy lỗi vào QuickFix nhưng không mở cửa sổ
    end,
})
-- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- local lspconfig = require("lspconfig")
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--
-- capabilities.textDocument.completion.completionItem = {
--     documentationFormat = { "markdown", "plaintext" },
--     snippetSupport = true,
--     preselectSupport = true,
--     insertReplaceSupport = true,
--     labelDetailsSupport = true,
--     deprecatedSupport = true,
--     commitCharactersSupport = true,
--     tagSupport = { valueSet = { 1 } },
--     resolveSupport = {
--         properties = {
--             "documentation",
--             "detail",
--             "additionalTextEdits",
--         },
--     },
-- }

-- lspconfig.rust_analyzer.setup({
--     capabilities = capabilities,
--     settings = {
--         ["rust-analyzer"] = {
--             cargo = { allFeatures = true },
--             checkOnSave = { command = "clippy" },
--             procMacro = { enable = true },
--         },
--     },
-- })


vim.loader.enable()


-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
