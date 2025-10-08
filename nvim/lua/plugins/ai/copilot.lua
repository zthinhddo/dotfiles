return {
  "zbirenbaum/copilot.lua",
  lazy = true,
  cmd = "Copilot",
  event = "InsertEnter",
  opts = function()
    require("copilot").setup({
      filetypes = {
        yaml = true,
        markdown = true,
        gitcommit = true,
        gitrebase = false,
        javascript = true,
        typescript = true,
        ["*"] = false,
      },
      suggestion = {
        enabled = true,
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
    })
  end,
}
