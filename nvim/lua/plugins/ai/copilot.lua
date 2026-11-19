return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
      vim.g.copilot_nes_debounce = 500
      vim.lsp.enable("copilot_ls")
      vim.keymap.set("n", "<tab>", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local state = vim.b[bufnr].nes_state
        if state then
          -- Try to jump to the start of the suggestion edit.
          -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
          local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
            or (require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit())
          return nil
        else
          -- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
          return "<C-i>"
        end
      end, { desc = "Accept Copilot NES suggestion", expr = true })
    end,
  },
  lazy = true, --  Copilot server takes long time to start
  cmd = "Copilot",
  event = "InsertEnter", -- initiatized only when actually modifying a buffer
  opts = {
    filetypes = {
      yaml = true,
      markdown = true,
      gitcommit = true,
      gitrebase = false,
      javascript = true,
      typescript = true,
      lua = true,
      ["*"] = false,
    },
    suggestion = {
      auto_trigger = true,
    },
    nes = {
      enabled = true,
      keymap = {
        accept_and_goto = "<leader>p",
        accept = false,
        dismiss = "<Esc>",
      },
    },
    panel = {
      enabled = false,
    },
  },
}
