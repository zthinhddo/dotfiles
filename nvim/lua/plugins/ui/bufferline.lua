return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  keys = {
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin buffer" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete non-pinned buffers" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete other buffers" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete buffers to the right" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete buffers to the left" },
  },
  opts = {
    options = {
      close_command = function(n)
        Snacks.bufdelete(n)
      end,
      right_mouse_command = function(n)
        Snacks.bufdelete(n)
      end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "snacks_layout_box",
          text = "Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
