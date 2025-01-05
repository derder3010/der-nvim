return {
	{ 
		"ellisonleao/gruvbox.nvim", 
		priority = 500 , 
		config = true, 
		opts = ...,

        config = function ()
            require("gruvbox").setup({
              terminal_colors = false, -- add neovim terminal colors
              undercurl = true,
              underline = true,
              bold = true,
              italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
              },
              strikethrough = true,
              invert_selection = false,
              invert_signs = false,
              invert_tabline = false,
              invert_intend_guides = false,
              inverse = true, -- invert background for search, diffs, statuslines and errors
              contrast = "", -- can be "hard", "soft" or empty string
              palette_overrides = {},
              overrides = {},
              dim_inactive = false,
              transparent_mode = true,
            })
        end
	},

	{
	    'NTBBloodbath/doom-one.nvim',
	    setup = function()
		-- Add color to cursor
			vim.g.doom_one_cursor_coloring = false
			-- Set :terminal colors
			vim.g.doom_one_terminal_colors = true
			-- Enable italic comments
			vim.g.doom_one_italic_comments = false
			-- Enable TS support
			vim.g.doom_one_enable_treesitter = true
			-- Color whole diagnostic text or only underline
            vim.g.doom_one_diagnostics_text_color = true
			-- Enable transparent background
			vim.g.doom_one_transparent_background = true

		-- Pumblend transparency
			vim.g.doom_one_pumblend_enable = true
			vim.g.doom_one_pumblend_transparency = 20

		-- Plugins integration
			vim.g.doom_one_plugin_neorg = true
			vim.g.doom_one_plugin_barbar = false
			vim.g.doom_one_plugin_telescope = true
			vim.g.doom_one_plugin_neogit = true
			vim.g.doom_one_plugin_nvim_tree = true
			vim.g.doom_one_plugin_dashboard = true
			vim.g.doom_one_plugin_startify = true
			vim.g.doom_one_plugin_whichkey = true
			vim.g.doom_one_plugin_indent_blankline = true
			vim.g.doom_one_plugin_vim_illuminate = true
			vim.g.doom_one_plugin_lspsaga = false
		end,
		-- config = function()
		--           require("doom-one").setup({
		--               transparent_mode = true,
		--           })
		--    end,
	},
    {
        "rose-pine/neovim", 
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "moon", -- auto, main, moon, or dawn
                dark_variant = "moon", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true, -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = false,
                    transparency = true,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                palette = {
                    -- Override the builtin palette per variant
                    -- moon = {
                    --     base = '#18191a',
                    --     overlay = '#363738',
                    -- },
                },

                highlight_groups = {
                    -- Comment = { fg = "foam" },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    -- if highlight.undercurl then
                    --     highlight.undercurl = false
                    -- end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            })

            -- vim.cmd("colorscheme rose-pine")
            -- vim.cmd("colorscheme rose-pine-main")
            -- vim.cmd("colorscheme rose-pine-moon")
            -- vim.cmd("colorscheme rose-pine-dawn")
        end
    }
}

