return {
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
            disable_inline_completion = true, -- disable inline completion for use with cmp
        })
      end,
    },
}
