require("der.remap")
require("der.lazy_init")
require("der.set")
require("der.lualine")
require("der.cmd")

require('scrollview').setup()

require('mini.starter').setup()

-- ColorScheme
-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme onedark")
-- vim.o.background = "dark"
-- vim.cmd([[colorscheme tokyonight]])

require("indent_blankline").setup({
  char = "│",
  show_trailing_blankline_indent = false, -- Tắt đường thụt lề cuối dòng trống
  show_current_context = false, -- Hiển thị ngữ cảnh hiện tại
  show_current_context_start = false, -- Hiển thị điểm bắt đầu ngữ cảnh
  filetype_exclude = { "lazy", "mason", "help" }, -- Loại trừ tệp không cần thiết
  buftype_exclude = { "terminal", "nofile" }, -- Loại trừ buffer không cần thiết
})

require("markview").setup({
	--- Time in miliseconds to wait before a redraw occurs(after any
    --- of the redraw events).
    ---
    --- Redraw events are, cursorMoved, "ModeChanged", "TextChanged";
    ---
    --- Change this depending on your machine's power
    ---@type integer
    debounce = 50,

    --- Filetypes where the plugin is enabled
    ---@type string[]
    filetypes = { "markdown", "quarto", "rmd" },

    --- Highlight groups to use.
    --- Can be a list of tables that define the highlight groups.
    ---@type "dynamic" | "light" | "dark" | table[]
    highlight_groups = "dark",

    hybrid_modes = nil,

    injections = {
        languages = {
            markdown = {
            	enable = true,
                --- This disables other
                --- injected queries!
                overwrite = true,
                query = [[
                    (section
                        (atx_headng) @injections.mkv.fold
                        (#set! @fold))
                ]]
            }
        }
    }
});
-- require('notify').setup({
--     background_colour = "#000000",
-- })
-- require('mini.tabline').setup()
--



-- cfg = {…}  -- add you config here
-- local cfg = {
--   floating_window_off_x = 5, -- adjust float windows x position.
--   floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
--     local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
--     local pumheight = vim.o.pumheight
--     local winline = vim.fn.winline() -- line number in the window
--     local winheight = vim.fn.winheight(0)
--
--     -- window top
--     if winline - 1 < pumheight then
--       return pumheight
--     end
--
--     -- window bottom
--     if winheight - winline < pumheight then
--       return -pumheight
--     end
--     return 0
--   end,
-- }
-- require "lsp_signature".setup(cfg)
