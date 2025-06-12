-- https://github.com/stevearc/conform.nvim
return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = {
            "prettier",
          },
          typescript = {
            "prettier",
          },
          graphql = {
            "prettier",
          },
          proto = {
            "buf",
          },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
          async = false,
        },
      })
    end,
  },
}
