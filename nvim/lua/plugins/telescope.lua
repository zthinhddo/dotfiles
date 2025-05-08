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
      defaults = {
        mappings = {
          n = {
            ["dd"] = require("telescope.actions").delete_buffer,
          },
          i = {
            ["dd"] = require("telescope.actions").delete_buffer,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "ivy",
          hidden = true,
        },
      },
      extensions = { fzf = {} },
    })
    require("telescope").load_extension("fzf")
  end,
}
