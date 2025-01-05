require("der.remap")
require("der.lazy_init")
require("der.set")
require("der.lualine")


-- ColorScheme
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme doom-one")
vim.cmd("colorscheme rose-pine-moon")

require("indent_blankline").setup({
  char = "│",
  show_trailing_blankline_indent = false, -- Tắt đường thụt lề cuối dòng trống
  show_current_context = false, -- Hiển thị ngữ cảnh hiện tại
  show_current_context_start = false, -- Hiển thị điểm bắt đầu ngữ cảnh
  filetype_exclude = { "lazy", "mason", "help" }, -- Loại trừ tệp không cần thiết
  buftype_exclude = { "terminal", "nofile" }, -- Loại trừ buffer không cần thiết
})
