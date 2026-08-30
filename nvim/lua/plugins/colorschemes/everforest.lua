return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  enabled = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function(opts)
    require("everforest").setup({
      background = "hard",
      colours_override = function(palette)
        palette.bg0 = "#1E2326"
      end,
    })
  end,
}
