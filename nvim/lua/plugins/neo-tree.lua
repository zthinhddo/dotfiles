return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neo_tree = require("neo-tree")
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_gitignored = false,
          hide_dotfiles = false,
          hide_hidden = false,
          hide_by_name = {}, -- Add some files wanna to hide
        },
      },
    })
  end,
}
