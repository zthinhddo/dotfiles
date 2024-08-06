return {
  "goolord/alpha-nvim",
  enabled = true,
  dependencies = {
    "echasnovski/mini.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("alpha").setup(require("alpha.themes.dashboard").config)
  end,
}
