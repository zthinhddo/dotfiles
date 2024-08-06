return {
  "nvimdev/dashboard-nvim",
  enabled = false,
  config = function()
    require("dashboard").setup({
      -- config
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
