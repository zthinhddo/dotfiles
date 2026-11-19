return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "vtsls",
      -- should be switched to vtsls when it is stable
      -- "ts_ls",
      "copilot",
      "jsonls",
      "stylua",
      "tailwindcss",
      "ruff",
    },
    automatic_enable = {
      exclude = { "copilot" },
    },
  },
}
