-- Toggle terminal while in editor buffers
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({})
    end,
  },
}
