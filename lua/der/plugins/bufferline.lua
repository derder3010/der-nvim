return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'ColorScheme',
    config = function()
        local highlights = require('rose-pine.plugins.bufferline')
        require('bufferline').setup({
            highlights = highlights,
            options = {
                always_show_bufferline = false,
            }
        })
    end
}
