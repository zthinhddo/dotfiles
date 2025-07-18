-- Show which line in buffer has git stage changes
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({})
  end,
}
