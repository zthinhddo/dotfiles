return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  opts = {},
  config = function()
    -- Replace web-icons-dev to mini.icons (migrate to MACOS)
    local mini_configs = require("mini.icons")
    mini_configs.setup()
    mini_configs.mock_nvim_web_devicons()

    local config = require("lualine")
    local custom_dragon_theme = require("plugins.colorschemes.customs.lualine_kanagawa")

    -- init config
    config.setup({
      options = {
        theme = custom_dragon_theme,
      },
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
        lualine_x = { "filetype", "fileformat" },
        lualine_y = { "encoding" },
        lualine_z = { "location" },
      },
    })
  end,
}
