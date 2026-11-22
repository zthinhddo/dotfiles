return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code / LSP" },
      { "<leader>f", group = "Find / Files" },
      { "<leader>g", group = "Git" },
      { "<leader>gh", group = "Git Hunks" },
      { "<leader>p", group = "Path" },
      { "<leader>s", group = "Search" },
      { "<leader>u", group = "UI / Toggles" },
      { "<leader>w", group = "Window" },
      { "<leader>x", group = "Diagnostics / Trouble" },
      { "gr", group = "LSP (Native)" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer local keymaps",
    },
  },
}
