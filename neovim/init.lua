-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local original_notify = vim.notify

vim.notify = function(msg, level, opts)
  if msg:match("Invalid plugin spec") then
    return
  end
  original_notify(msg, level, opts)
end

require("configs.setup").setup()

-- Load Plugins
require("lazy").setup({
  { import = "plugins.essential" },
  { import = "plugins.lsp" },
  { import = "plugins.tool" },
  { import = "plugins.ui" },
  { import = "plugins.editor" },
  { import = "plugins.tag" }, -- temporary
  { import = "configs.keymap" },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup({
        style = 'warmer',
      })
      require('onedark').load()
    end
  },
}, {
  install = {
    colorscheme = { "onedark" },
  },
  checker = {
    enabled = true
  },
  spec = {
    strict = false
  }
})
