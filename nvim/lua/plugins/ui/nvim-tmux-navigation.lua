return {
  "alexghergh/nvim-tmux-navigation",
  opts = {
    disable_when_zoomed = true,
  },
  keys = {
    {
      "<C-h>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
      end,
      desc = "Navigate left (tmux/window)",
    },
    {
      "<C-j>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateDown()
      end,
      desc = "Navigate down (tmux/window)",
    },
    {
      "<C-k>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateUp()
      end,
      desc = "Navigate up (tmux/window)",
    },
    {
      "<C-l>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateRight()
      end,
      desc = "Navigate right (tmux/window)",
    },
    {
      "<C-\\>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateLastActive()
      end,
      desc = "Navigate last active (tmux/window)",
    },
    {
      "<C-Space>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateNext()
      end,
      desc = "Navigate next (tmux/window)",
    },
  },
}
