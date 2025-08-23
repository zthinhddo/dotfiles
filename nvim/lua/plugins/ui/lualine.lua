return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
    },
    sections = {},
  },
  config = function()
    local config = require("lualine")

    config.setup({
      sections = {
        lualine_a = {
          function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
              return "Rec @" .. reg
            else
              local mode = vim.api.nvim_get_mode().mode
              local mode_map = {
                n = "NORMAL",
                i = "INSERT",
                v = "VISUAL",
                V = "V-LINE",
                ["^V"] = "V-BLOCK",
                c = "COMMAND",
                R = "REPLACE",
                s = "SELECT",
                S = "S-LINE",
                ["^S"] = "S-BLOCK",
                t = "TERMINAL",
              }

              -- Return mode name
              return mode_map[mode] or mode:upper()
            end
          end,
        },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
