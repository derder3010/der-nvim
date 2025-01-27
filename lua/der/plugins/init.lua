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
    },
    { "RRethy/vim-illuminate", event = "VeryLazy" },
    -- {
    --     "dstein64/vim-startuptime",
    --     cmd = "StartupTime",
    --     config = function()
    --         vim.g.startuptime_tries = 10
    --     end,
    -- }

    {
        'https://codeberg.org/esensar/nvim-dev-container',
        dependencies = 'nvim-treesitter/nvim-treesitter'
    },
    'psliwka/vim-smoothie',
}
