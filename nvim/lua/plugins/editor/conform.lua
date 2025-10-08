return {
  "stevearc/conform.nvim",
  opts = function()
    require("conform").setup({
      formatters_by_ft = {
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
      },
    })
  end,
}
