return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>/', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<C-g>', builtin.git_files, { desc = 'Telescope find git files' })
	vim.keymap.set('n', '<leader>g', function()
		builtin.grep_string({ search = vim.fn.input( "Grep > ") });
	end)
	vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope find words' })
    end
}

