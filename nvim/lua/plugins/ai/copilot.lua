return {
  "zbirenbaum/copilot.lua",
  lazy = true, --  Copilot server takes long time to start
  cmd = "Copilot",
  -- @type copilot.Config
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
      enabled = false,
      auto_trigger = true,
      hide_during_completion = true,
      debounce = 75,
      trigger_on_accept = true,
      keymap = {
        accept = "<M-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
  },
}
