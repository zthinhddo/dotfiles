-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
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

vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  spec = {
    {
      "ellisonleao/gruvbox.nvim",
      config = function()
        require("gruvbox").setup({
          terminal_colors = true, -- add neovim terminal colors
          undercurl = true,
          underline = true,
          bold = true,
          italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
          },
          strikethrough = true,
          invert_selection = false,
          invert_signs = false,
          invert_tabline = false,
          inverse = true, -- invert background for search, diffs, statuslines and errors
          contrast = "", -- can be "hard", "soft" or empty string
          palette_overrides = {},
          overrides = {},
          dim_inactive = false,
          transparent_mode = true,
        })
      end,
    },
    {
      "stevearc/conform.nvim",
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            lua = { "stylua" },
            javascript = {
              "prettierd",
              "prettier",
              stop_after_first = true,
            },
          },
        })
      end,
    },
    {
      "echasnovski/mini.nvim",
      version = false,
      config = function()
        require("mini.pairs").setup()
      end,
    },
    {
      "williamboman/mason.nvim",
      config = function()
        local mason = require("mason")
        mason.setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        })
      end,
    },
    -- These packages are recommended in Mason plugins manual
    {
      "mhartington/formatter.nvim",
    },
    {
      "neovim/nvim-lspconfig",
    },
    {
      "williamboman/mason-lspconfig.nvim",
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
    },
    {
      "mfussenegger/nvim-dap",
    },
    {
      "mfussenegger/nvim-lint",
    },
    -- These packages are recommended in Mason plugins manual
    {
      "gbprod/yanky.nvim",
      opts = {},
    },
    {
      "alexghergh/nvim-tmux-navigation",
      config = function()
        local nvim_tmux_nav =
          require("nvim-tmux-navigation")

        nvim_tmux_nav.setup({
          disable_when_zoomed = true, -- defaults to false
        })
      end,
    },
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = false, -- get a notification when changes are found
  },
})
