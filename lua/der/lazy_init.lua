local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "der.plugins",
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "rose-pine-mon" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
