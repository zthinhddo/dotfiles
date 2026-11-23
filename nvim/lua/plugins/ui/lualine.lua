return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  opts = function()
    -- local custom_dragon_theme = require("plugins.colorschemes.customs.lualine_kanagawa")

    local mode_map = {
      n = "NORMAL",
      i = "INSERT",
      v = "VISUAL",
      V = "V-LINE",
      ["\22"] = "V-BLOCK",
      c = "COMMAND",
      R = "REPLACE",
      s = "SELECT",
      S = "S-LINE",
      ["\19"] = "S-BLOCK",
      t = "TERMINAL",
    }

    return {
      options = {
        -- theme = custom_dragon_theme,
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
              return "Rec @" .. reg
            end
            local mode = vim.api.nvim_get_mode().mode
            return mode_map[mode] or mode:upper()
          end,
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          -- Native Neovim 0.12 LSP progress status (replaces noice.nvim progress spinner)
          function()
            return vim.ui.progress_status and vim.ui.progress_status() or ""
          end,
          "filetype",
          "fileformat",
        },
        lualine_y = { "encoding" },
        lualine_z = { "location" },
      },
    }
  end,
}
