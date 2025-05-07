return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  keys = {
    {
      "<leader>cm",
      function()
        vim.cmd("Mason")
      end,
      desc = "Open Mason",
    },
  },
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
    },
  },
}
