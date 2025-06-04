-- ~/.config/nvim/lua/core/options.lua
local opt = vim.opt -- Shorthand for options
local g = vim.g     -- Global variables

-- General settings
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.tabstop = 4           -- Number of spaces for a tab
opt.shiftwidth = 4        -- Spaces for auto-indent
opt.expandtab = true      -- Use spaces instead of tabs
opt.mouse = 'a'           -- Enable mouse support
-- opt.clipboard = 'unnamedplus' -- Use system clipboard

opt.fixeol = false
opt.foldlevel = 99
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

opt.ignorecase = true

-- Global variables
g.mapleader = ',' -- Leader key


-- Table to set tab sizes based on filetype
local filetype_tab_sizes = {
  lua = { tabstop = 2, shiftwidth = 2, expandtab = true },
  python = { tabstop = 4, shiftwidth = 4, expandtab = true },
  make = { tabstop = 8, shiftwidth = 8, expandtab = false },
  json = { tabstop = 2, shiftwidth = 2, expandtab = true },
  javascript = { tabstop = 2, shiftwidth = 2, expandtab = true },
  yaml = { tabstop = 2, shiftwidth = 2, expandtab = true },
  cs = { tabstop = 4, shiftwidth = 4, expandtab = true },
}

-- Apply tab settings for each filetype
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local settings = filetype_tab_sizes[args.match]
    if settings then
      vim.bo.tabstop = settings.tabstop
      vim.bo.shiftwidth = settings.shiftwidth
      vim.bo.expandtab = settings.expandtab
    end
  end,
})


-- install lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


vim.o.shell = "powershell.exe"
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.o.shellquote = "\""
vim.o.shellxquote = "\""


