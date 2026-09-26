return {
  "zbirenbaum/copilot.lua",
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
      enabled = false, -- disable inline susggestions
    },
    panel = {
      enabled = false,
    },
  },
}
