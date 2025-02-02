local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg       = '',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
    tp       = ''
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        globalstatus = true,
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

-- ins_left {
--     function()
--         return '['
--     end,
--     -- color = { fg = colors.bg }, -- Sets highlighting of component
--     -- padding = { left = 0, right = 1 }, -- We don't need space before this
-- }

ins_left {
    -- mode component
    -- mode = vim.fn.mode(),
    function()
        local mode_map = {
            ['n'] = 'NOR',
            ['i'] = 'INS',
            ['v'] = 'VIS',
            ['V'] = 'V-L',
            [''] = 'V-B', -- This is Ctrl-V
            ['c'] = 'CMD',
            ['R'] = 'REP',
            ['s'] = 'SEL',
            ['S'] = 'S-L',
            [''] = 'S-B', -- This is Ctrl-S
            ['t'] = 'TER',
        }

        local current_mode = vim.fn.mode()
        return mode_map[current_mode] or current_mode
    end,
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.yellow,
            [''] = colors.blue,
            V = colors.yellow,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
    end,
    padding = { right = 1 },
}

-- ins_left {
--   'filename',
--   cond = conditions.buffer_not_empty,
--   color = { fg = colors.magenta, gui = 'bold' },
-- }

-- ins_left {
--     function()
--         local full_path = vim.fn.expand('%:p') -- Lấy đường dẫn đầy đủ
--         return full_path:gsub(vim.env.HOME, "~") -- Thay đường dẫn HOME bằng ~
--     end,
--     cond = conditions.buffer_not_empty,
--     color = { fg = colors.magenta, gui = 'bold' },
-- }

ins_left {
    function()
        -- Get the full path and replace HOME with ~
        local full_path = vim.fn.expand('%:p:h')
        full_path = full_path:gsub(vim.env.HOME, "~")

        -- Check if the file is modified (unsaved changes)
        -- if vim.bo.modified then
        --     return full_path .. " " -- Add a dot or icon to indicate unsaved
        -- end
        return full_path
    end,
    -- cond = conditions.buffer_not_empty,
    -- color = function()
    --     if vim.bo.modified then
    --         return { fg = colors.red, gui = 'bold' }   -- Red for unsaved
    --     else
    --         return { fg = colors.green, gui = 'bold' } -- Green for saved
    --     end
    -- end,
}


ins_left {
    'filesize',
    cond = conditions.buffer_not_empty,
}



ins_left { 'location' }

ins_left {
    'progress',
    fmt = function()
        return "%P/%L"
    end,
    color = { fg = colors.fg, gui = 'bold' }
}

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    -- symbols = { error = ' ', warn = ' ', info = ' ' },
    symbols = { error = 'E ', warn = 'W ', info = 'I ' },
    diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.cyan },
    },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = function()
        if vim.bo.modified then
            return { fg = colors.red, gui = 'bold' }   -- Red for unsaved
        else
            return { fg = colors.green, gui = 'bold' } -- Green for saved
        end
    end,
}
-- ins_left {
--     function()
--         local fname = vim.fn.expand('%:t')
--         local icon = vim.bo.modified and " " or ""
--         return fname .. icon
--     end,
--     cond = conditions.buffer_not_empty,
--     color = function()
--         if vim.bo.modified then
--             return { fg = colors.red, gui = 'bold' }
--         else
--             return { fg = colors.green, gui = 'bold' }
--         end
--     end,
-- }

ins_right {
    function() return require("noice").api.status.command.get() end,
    cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
    color = { fg = colors.red }
}


ins_right {
    function() return require("noice").api.status.mode.get() end,
    cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
    color = { fg = colors.red }
}
ins_right {
    require("lazy.status").updates,
    cond = require("lazy.status").has_updates,
    color = { fg = colors.red }
}

ins_right {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
            return msg
        end

        local active_client = {}
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                -- return client.name
                table.insert(active_client, client.name)
            end
        end
        -- return msg
        if #active_client > 0 then
            return "[" .. table.concat(active_client, ', ') .. "]"
        else
            return msg
        end
    end,
    -- icon = ' LSP:',
    -- icon = 'LSP:',
    color = { fg = colors.magenta, gui = 'bold' },
}

ins_right {
    function()
        local indent = vim.api.nvim_get_option_value("shiftwidth", {})
        local is_spaces = vim.api.nvim_get_option_value("expandtab", {}) and "spaces" or "tabs"
        return string.format("->|%d %s", indent, is_spaces)
    end,
    -- icon = "",
    cond = conditions.buffer_not_empty,
}

-- Add components to right sections
-- ins_right {
--     'o:encoding',       -- option component same as &encoding in viml
--     fmt = string.upper, -- I'm not sure why it's upper case either ;)
--     cond = conditions.hide_in_width,
--     color = { fg = colors.green, gui = 'bold' },
-- }

ins_right {
    'filetype',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'branch',
    fmt = function(str)
        return '‹' .. str .. '›'
    end,
    -- icon = '',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    -- symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    symbols = { added = '+', modified = '~', removed = '-' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

-- ins_right {
--     function()
--         return ']'
--     end,
--     -- color = { fg = colors.bg },
--     padding = { left = 0 },
-- }

-- Now don't forget to initialize lualine
lualine.setup(config)
