-- return {
--     {
--         "nvim-neo-tree/neo-tree.nvim",
--         branch = "v3.x",
--         dependencies = {
--           "nvim-lua/plenary.nvim",
--           "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--           "MunifTanjim/nui.nvim",
--     	},
--
-- 	}
-- }
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {
    --   "s1n7ax/nvim-window-picker",
    --   version = "2.*",
    --   config = function()
    --     require("window-picker").setup({
    --       filter_rules = {
    --         include_current_win = false,
    --         autoselect_one = true,
    --         bo = {
    --           -- if the file type is one of following, the window will be ignored
    --           filetype = { "neo-tree", "neo-tree-popup", "notify" },
    --           -- if the buffer type is one of following, the window will be ignored
    --           buftype = { "terminal", "quickfix" },
    --         },
    --       },
    --     })
    --   end,
    -- },
  },
  config = function()
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
      lazy = false,
      close_if_last_window = false,
      popup_border_style = nil,
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      sort_case_insensitive = false,
      sort_function = nil,
      default_component_configs = {
        container = { enable_character_fade = true },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          default = "*",
          highlight = "NeoTreeFileIcon",
        },
        modified = { symbol = "[+]", highlight = "NeoTreeModified" },
        name = { trailing_slash = false, use_git_status_colors = true, highlight = "NeoTreeFileName" },
        git_status = {
          symbols = {
            added = "",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
        file_size = { enabled = true, width = 12, required_width = 64 },
        type = { enabled = true, width = 10, required_width = 122 },
        last_modified = { enabled = true, width = 20, required_width = 88 },
        created = { enabled = true, width = 20, required_width = 110 },
        symlink_target = { enabled = false },
      },
      commands = {},
      window = {
        position = "bottom",
        -- width = 40,
        mappings = {
          ["<space>"] = { "toggle_node", nowait = false },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel",
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["%"] = { "add", config = { show_path = "none" } },
          ["d"] = "add_directory",
          ["D"] = "delete",
          ["r"] = "rename",
          -- ["b"] = "rename_basename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = { enabled = true, leave_dirs_open = true },
        group_empty_dirs = false,
        -- hijack_netrw_behavior = "disabled", -- to set "open_default"
        hijack_netrw_behavior = "open_current", -- to set "open_default"
        use_libuv_file_watcher = true,
        window = {
          -- position = "left",
          mappings = {
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["F"] = "fuzzy_finder_directory",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
          },
        },
      },
      event_handlers = {
        {
            event = "file_opened",
            handler = function ()
                -- Auto-close the tree when opening a file
                require("neo-tree.command").execute({ action = "close" })
            end,
        },
      },
      buffers = {
        follow_current_file = { enabled = true, leave_dirs_open = false },
        group_empty_dirs = true,
        show_unloaded = true,
        window = { mappings = { ["bd"] = "buffer_delete", ["<bs>"] = "navigate_up", ["."] = "set_root" } },
      },
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
      },
    })
    -- vim.cmd([[nnoremap \ :Neotree float<cr>]])
  end,
}

