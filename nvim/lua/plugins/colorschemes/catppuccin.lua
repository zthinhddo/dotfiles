return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  enabled = false,
  opts = {
    flavor = "mocha",
  },
  config = function()
    require("catppuccin").setup({
      transparent_background = false,
      custom_highlights = function(colors)
        return {
          -- Normal/inactive line numbers (makes them bright text color)
          LineNr = { fg = colors.lavender },

          -- Active/current line number (makes it stand out, e.g., lavender or yellow)
          CursorLineNr = { fg = colors.pink, bold = true },
        }
      end,
    })
  end,
}
