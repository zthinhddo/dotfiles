-- Enable Lua module bytecode caching
if vim.loader then
  vim.loader.enable()
end

-- Leaders must be set before lazy.nvim loads plugin specs & keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Neovim 0.12 native UI2 (replaces noice.nvim cmdline & message routing)
local ok_ui2, ui2 = pcall(require, "vim._core.ui2")
if ok_ui2 then
  ui2.enable({})
end

-- Neovim 0.12 built-in opt-in packages (:Undotree, :DiffTool)
pcall(vim.cmd.packadd, "nvim.undotree")
pcall(vim.cmd.packadd, "nvim.difftool")

-- Core configuration (options before plugins, then autocmds/keymaps/lsp, then lazy.nvim)
require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.lsp")
require("config.lazy")
