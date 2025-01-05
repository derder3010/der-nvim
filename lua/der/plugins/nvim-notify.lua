return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    level = 2,
    minimum_width = 50,
    render = "compact",
    stages = "fade_in_slide_out",
    timeout = 3000,
    top_down = false,
  },
  config = function(_, opts)
    require("notify").setup(opts)
    vim.g.startup_message = true

    vim.notify = require "notify"

    local messages = require "der.messages"
    math.randomseed(os.time())
    local randomMessage = messages[math.random(#messages)]

    if vim.g.startup_message and randomMessage then
      vim.notify(randomMessage, vim.log.levels.INFO, { title = "Just For Fun:" })
    end
  end,
}
