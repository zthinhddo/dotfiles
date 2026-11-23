return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    quickfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    explorer = {
      enabled = true,
      replace_netrw = true,
      trash = true,
    },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
            ██████╗██╗  ██╗ ██████╗ ██████╗ ██╗   ██╗███████╗              ███████╗██╗     ███╗   ███╗
          ██╔════╝██║  ██║██╔═══██╗██╔══██╗██║   ██║██╔════╝              ██╔════╝██║     ████╗ ████║
          ██║     ███████║██║   ██║██████╔╝██║   ██║███████╗    █████╗    █████╗  ██║     ██╔████╔██║
          ██║     ██╔══██║██║   ██║██╔══██╗██║   ██║╚════██║    ╚════╝    ██╔══╝  ██║     ██║╚██╔╝██║
          ╚██████╗██║  ██║╚██████╔╝██║  ██║╚██████╔╝███████║              ██║     ███████╗██║ ╚═╝ ██║
            ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝              ╚═╝     ╚══════╝╚═╝     ╚═╝
        ]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    picker = {
      enabled = true,
      hidden = true,
      ignored = false,
      matcher = {
        frecency = {
          enabled = true,
          ignore_patterns = { "*/.git/*", "*/node_modules/*" },
        },
      },
      sources = {
        files = {
          transform = function(item)
            if item.file and (item.file:match("%.spec%.")) then
              item.score_mul = 0.5
            end
          end,
        },
        explorer = {
          enabled = true,
          auto_close = true,
          layout = {
            layout = {
              box = "horizontal",
              width = 0.8,
              min_width = 120,
              height = 0.8,
              {
                box = "vertical",
                border = true,
                title = "{title} {live} {flags}",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
              { win = "preview", title = "{preview}", border = true, width = 0.5 },
            },
          },
        },
      },
    },
    words = { enabled = false },
  },
  -- stylua: ignore
  keys = {
    -- Explorer & Files
    { "<leader>e", function() Snacks.explorer() end, desc = "File explorer" },
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart find files" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config file" },

    -- Search / Grep
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, mode = { "n", "x" }, desc = "Grep word / selection" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help pages" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume picker" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP document symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP workspace symbols" },

    -- Git
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },

    -- Buffers & Notifications
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss notifications" },
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification history" },
  },
}
