return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  enabled = true,
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#BD0F72", bold = true })
      end,
    })
  end,
  opts = {
    statementStyle = { bold = false },
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.cmd.colorscheme("kanagawa-dragon")
  end,
}
