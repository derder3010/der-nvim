return {
    'dstein64/nvim-scrollview',
    'nvim-lua/plenary.nvim',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    { 'echasnovski/mini.nvim', version = '*' },
    {
        'nvim-lualine/lualine.nvim',
        event = "ColorScheme",
        config = function()
            require("lualine").setup({
                options = {
                    --- @usage 'rose-pine' | 'rose-pine-alt'
                    theme = "rose-pine"
                }
            })
        end
    },
    { "RRethy/vim-illuminate", event = "VeryLazy" },
    'psliwka/vim-smoothie',
    'windwp/nvim-ts-autotag',
    "nmac427/guess-indent.nvim",
    -- lazy.nvim example
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = false
    },
    {
        'numToStr/Comment.nvim',
    }
}
