return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
            })

            -- vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics<cr>")
            
            -- vim.keymap.set("n", "[t", function()
            --     require("trouble").next({skip_groups = true, jump = true});
            -- end)
            --
            -- vim.keymap.set("n", "]t", function()
            --     require("trouble").previous({skip_groups = true, jump = true});
            -- end)

        end
    },
}
