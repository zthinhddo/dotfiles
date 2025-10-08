return {
  "folke/snacks.nvim",
  opts = {
    explorer = {}, -- Explorer: use default settings
    picker = {
      enabled = true,
      hidden = true,
      ignored = false,
      sources = {
        explorer = {}, -- Explorer picker: use default setting
        files = { hidden = true, ignored = false },
      },
    },
  },
}
