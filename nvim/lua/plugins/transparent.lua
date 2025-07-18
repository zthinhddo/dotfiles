return {
  "xiyaowong/transparent.nvim",
  enabled = false,
  lazy = false, -- Avoid lazy loading for consistent loading
  config = function()
    require("transparent").setup({
      extra_groups = {
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NormalFloat",
      },
    })
  end,
}
