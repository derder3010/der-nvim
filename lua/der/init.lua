require("der.remap")
require("der.lazy_init")
require("der.set")
require("der.lualine")
require("der.cmd")

require('scrollview').setup()

require('mini.starter').setup()

-- ColorScheme
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme onedark")
-- vim.cmd([[colorscheme tokyonight]])

-- neonhive, breakingbad, batman, ironman_dark, cody, cold, matrix, darkmatrix, nordic-aurora, superman, topology
-- vim.cmd("colorscheme batman")
vim.cmd("colorscheme gruber-darker")
vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi BufferLine ctermbg=none guibg=none")
vim.cmd("let &fcs='eob: '")
vim.cmd("doautocmd ColorScheme")
-- vim.o.background = "dark"
-- vim.o.termguicolors = true
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- vim.cmd([[
--   highlight Normal guibg=none
--   highlight NormalFloat guibg=none
-- ]])

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
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

require("devcontainer").setup {}

require('nvim-treesitter.configs').setup {
    ensure_installed = { "jsonc" }
}
