return {
  "akinsho/bufferline.nvim",
  version = "^4.9.1",
  enabled = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({})
  end,
}
