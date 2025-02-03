return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            -- defaults = {
            --     layout_strategy = "bottom_pane",
            --     layout_config = {
            --         height = 12, -- Adjust panel height
            --         prompt_position = "top",
            --     },
            --     sorting_strategy = "ascending", -- Show results from top to bottom
            --     preview = false,                -- No preview
            --     border = false,                 -- Remove borders
            --     results_title = false,          -- No title above results
            --     prompt_title = false,           -- No title above prompt
            --     dynamic_preview_title = false,  -- No dynamic preview title
            --     winblend = 0,                   -- No transparency (set to 10-20 for slight transparency)
            -- },
            extensions = {
                file_browser = {
                    layout_strategy = "bottom_pane",
                    layout_config = { height = 16 },
                    sorting_strategy = "ascending", -- Show results from top to bottom
                    previewer = false,              -- No preview
                    border = false,                 -- Remove borders
                    results_title = false,          -- No title above results
                    prompt_title = false,           -- No title above prompt
                    dynamic_preview_title = false,  -- No dynamic preview title
                    -- hijack_netrw = true,
                    dir_icon = "",
                    git_status = false,
                    follow_symlinks = true,
                    use_ui_input = false,
                    add_dirs = false,
                    depth = 4,
                    select_buffer = true,
                    prompt_path = true,
                    quiet = false,

                },
            },
        })

        require("telescope").load_extension("file_browser")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>/', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<C-g>', builtin.git_files, { desc = 'Telescope find git files' })
        vim.keymap.set('n', '<leader>g', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope find words' })
    end
}
