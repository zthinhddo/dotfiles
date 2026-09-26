require("config.lazy")

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", {
        fg = "#BD0F72",
        bold = true,
        link = nil,
        force = true,
      })
    end)
  end,
})
