return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- style = "vivid", -- more saturated colors
    transparent = true,
    styles = {
      floats = "transparent",
      sidebars = "transparent",
    },
  },
  config = function(_, opts)
    require("solarized-osaka").setup(opts)
    vim.cmd.colorscheme("solarized-osaka")
  end,
}
