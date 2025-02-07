return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        picker = {
            -- icons = {
            --     files = {
            --         enabled = false, -- show file icons
            --     },
            -- },
            -- layout = {
            --     preview = false,
            --     preset = "vertical",
            --     layout = {
            --         backdrop = false,
            --         min_width = 80,
            --         height = 0.4,
            --         min_height = 3,
            --         box = "vertical",
            --         position = "bottom",
            --         border = "none",
            --     }
            -- }
        },
        explorer = {
            replace_netrw = false,
        },
        bigfile = {
            enabled = true
        },
        quickfile = { enabled = true },
        words = { enabled = true },
        indent = {
            priority = 1,
            enabled = false,      -- enable indent guides
            char = "│",
            only_scope = false,   -- only show indent guides of the scope
            only_current = false, -- only show indent guides in the current window
            hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
        },
        -- animate = {
        --     enabled = false,
        -- },
        animate = {
            enabled = vim.fn.has("nvim-0.10") == 1,
            style = "out",
            easing = "linear",
            duration = {
                step = 20,   -- ms per step
                total = 500, -- maximum duration
            },
        },
        scope = {
            enabled = false, -- enable highlighting the current scope
            priority = 200,
            char = "│",
            underline = false,    -- underline the start of the scope
            only_current = false, -- only show scope in the current window
            hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
        },
        chunk = {
            -- when enabled, scopes will be rendered as chunks, except for the
            -- top-level scope which will be rendered as a scope.
            enabled = false,
            -- only show chunk scopes in the current window
            only_current = false,
            priority = 200,
            hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
            char = {
                corner_top = "┌",
                corner_bottom = "└",
                -- corner_top = "╭",
                -- corner_bottom = "╰",
                horizontal = "─",
                vertical = "│",
                arrow = ">",
            },
        },
        blank = {
            -- char = " ",
            char = "·",
            hl = "SnacksIndentBlank", ---@type string|string[] hl group for blank spaces
        },
    },
    keys = {
        -- { "<leader>ff", function() Snacks.picker.files() end,   desc = "Smart Find Files" },
        -- { "<leader>b",  function() Snacks.picker.buffers() end, desc = "Buffers" },
        -- {
        --     "<leader><space>",
        --     function()
        --         Snacks.picker.smart({
        --             ui_select = false,
        --             sort = { fields = { "sort" } },
        --             supports_live = true,
        --             watch = true,
        --             icons = {
        --                 files = {
        --                     enabled = false, -- show file icons
        --                 },
        --             },
        --             layout = {
        --                 preview = false,
        --                 preset = "vertical",
        --                 layout = {
        --                     backdrop = false,
        --                     min_width = 80,
        --                     height = 0.4,
        --                     min_height = 3,
        --                     box = "vertical",
        --                     position = "bottom",
        --                     border = "none",
        --                 }
        --             },
        --             formatters = {
        --                 file = {
        --                     filename_only = false,
        --                     format = function(file)
        --                         local stat = vim.loop.fs_stat(file.path)
        --                         if not stat then return file.filename end
        --
        --                         local size = stat.size
        --                         local mode = stat.mode                        -- Get file permissions
        --                         local perms = string.format("%o", mode % 512) -- Convert to octal permissions
        --
        --                         return string.format("%s %10d %s", perms, size, file.filename)
        --                     end,
        --                 }
        --             }
        --         })
        --     end,
        --     desc = "Find Files"
        -- },
        { "<leader>p", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>f", function() Snacks.picker.grep() end,     desc = "Grep" },
        {
            "<leader>e",
            function()
                Snacks.explorer({
                    ui_select = false,
                    finder = "explorer",
                    sort = { fields = { "sort" } },
                    supports_live = true,
                    tree = true,
                    watch = true,
                    diagnostics = true,
                    diagnostics_open = false,
                    git_status = true,
                    git_status_open = false,
                    follow_file = true,
                    focus = "list",
                    auto_close = false,
                    jump = { close = false },
                    layout = {
                        preset = "vscode",
                        preview = false,
                        layout = {
                            backdrop = false,
                            row = 1,
                            width = 0.15,
                            position = "left",
                            border = "none",
                            box = "vertical",
                        },
                    }
                    ,
                    formatters = {
                        file = { filename_only = true },
                        severity = { pos = "right" },
                    },
                    matcher = { sort_empty = false, fuzzy = false },
                    win = {
                        list = {
                            keys = {
                                ["<BS>"] = "explorer_up",
                                ["l"] = "confirm",
                                ["h"] = "explorer_close",
                                ["a"] = "explorer_add",
                                ["D"] = "explorer_del",
                                ["r"] = "explorer_rename",
                                ["c"] = "explorer_copy",
                                ["m"] = "explorer_move",
                                ["o"] = "explorer_open",
                                ["P"] = "toggle_preview",
                                ["y"] = "explorer_yank",
                                ["u"] = "explorer_update",
                                ["<c-c>"] = "tcd",
                                ["."] = "explorer_focus",
                                ["I"] = "toggle_ignored",
                                ["H"] = "toggle_hidden",
                                ["Z"] = "explorer_close_all",
                                ["]g"] = "explorer_git_next",
                                ["[g"] = "explorer_git_prev",
                                ["]d"] = "explorer_diagnostic_next",
                                ["[d"] = "explorer_diagnostic_prev",
                                ["]w"] = "explorer_warn_next",
                                ["[w"] = "explorer_warn_prev",
                                ["]e"] = "explorer_error_next",
                                ["[e"] = "explorer_error_prev",
                            },
                        },
                    },
                })
            end,
            desc = "File Explorer"
        },
    }
}
