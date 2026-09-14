-- vim.loader only support +0.9 version
if vim.loader then vim.loader.enable() end

-------------------------------------------------
-- GLOBAL
-------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- Used for filetype specific plugins

-------------------------------------------------
-- IMPORTS
--------------------------------------------------
require("sheng.pack")
require("sheng.config.options")
require("sheng.config.keymaps")
require("sheng.config.autocmds")
require("sheng.plugins.lsp.lspconfig")
require("sheng.plugins.colorschemes")

-- UTILITIES & COMMON
require("sheng.plugins.mini")

-- Treesitter
require("sheng.plugins.treesitter")

-- New UI and status line
require('vim._core.ui2').enable({})
