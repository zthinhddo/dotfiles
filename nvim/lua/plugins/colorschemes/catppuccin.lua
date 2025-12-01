return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  enabled = true,
  opts = {
    flavor = "mocha",
  },
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
    })
  end,
}
