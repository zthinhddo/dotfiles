-- Enable Lua module bytecode caching
if vim.loader then
  vim.loader.enable()
end

-- Leaders must be set before lazy.nvim loads plugin specs & keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core configuration (options before ui2 & plugins so cmdheight = 0 is active)
require("config.options")

-- Neovim 0.12 native UI2 (replaces noice.nvim cmdline & message routing)
local ok_ui2, ui2 = pcall(require, "vim._core.ui2")
if ok_ui2 then
  ui2.enable({
    enable = true,
    msg = {
      targets = "msg", -- Route transient messages to floating msg window so cmdheight=0 won't cover lualine
    },
  })
end

require("config.autocmds")
require("config.keymaps")
require("config.lsp")
require("config.lazy")

-- Neovim 0.12 built-in opt-in packages (:Undotree, :DiffTool)
-- Must run AFTER lazy.nvim so its runtimepath reset does not strip these opt packages
pcall(vim.cmd.packadd, "nvim.undotree")
pcall(vim.cmd.packadd, "nvim.difftool")
