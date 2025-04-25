return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier", "prettierd", "deno_fmt" },
      typescript = { "prettier", "prettierd", "deno_fmt" },
    },
    format_on_save = {
      -- I recommend these options. See :help conform.format for details.
      lsp_format = "fallback",
      timeout_ms = 500,
    },
  },
}
