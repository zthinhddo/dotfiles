return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    require("telescope").setup({
      pickers = {
        git_files = {
          theme = "ivy",
          hidden = false,
        },
        buffers = {
          theme = "ivy",
          hidden = false,
        },
        find_files = {
          theme = "ivy",
          hidden = true,
          layout_config = {
            height = 54,
          },
        },
      },
      extensions = { fzf = {} },
    })
    require("telescope").load_extension("fzf")
  end,
}
