return {
    {
      'mrcjkb/rustaceanvim',
      version = '^5', -- Recommended
      lazy = false, -- This plugin is already lazy
    },

    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup({
                completion = {
                    cmp = {
                        enabled = true,
                    },
                },
            })
        end,
    },
    -- {
    --     "saecki/live-rename.nvim",
    --     config = function()
    --         -- start in normal mode and jump to the start of the word
    --         require("live-rename").rename()
    --
    --         -- start in insert mode and jump to the end of the word
    --         require("live-rename").rename({ insert = true })
    --
    --         -- start in insert mode with an empty word
    --         require("live-rename").rename({ text = "", insert = true })
    --     end,
    -- },
    {
        'mg979/vim-visual-multi',
        branch = 'master',
        config = function ()
            -- Tạo bảng map key cho vim-visual-multi
            vim.g.VM_maps = {
              ['Find Under'] = '<C-d>',         -- Thay thế cho C-n
              ['Find Subword Under'] = '<C-d>', -- Thay thế cho visual C-n
            }
        end
    }
}
