return {
  "xiyaowong/transparent.nvim",
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
