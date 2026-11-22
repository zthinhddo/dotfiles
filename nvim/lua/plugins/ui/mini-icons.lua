return {
  "nvim-mini/mini.icons",
  lazy = false,
  priority = 1100,
  opts = {
    style = "glyph",
  },
  config = function(_, opts)
    local icons = require("mini.icons")
    icons.setup(opts)
    icons.mock_nvim_web_devicons()
  end,
}
