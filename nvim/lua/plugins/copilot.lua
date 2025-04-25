return {
  "zbirenbaum/copilot.lua",
  lazy = true,
  cmd = "Copilot",
  event = "BufReadPost",
  opts = {
    keymap = {
      accept = "<Tab>",
      next = "<C-n>",
      prev = "<C-p>",
    },
  },
}
