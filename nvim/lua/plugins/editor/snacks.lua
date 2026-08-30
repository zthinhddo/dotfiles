return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true, -- Replace netrw with the snacks explorer
      trash = true, -- Use the system trash can when deleting files
    }, -- Explorer: use default settings
    dashboard = {
      preset = {
        header = [[]],
      },
    },
    picker = {
      enabled = true,
      hidden = true,
      ignored = false, -- default hide ignored files/folders
      sources = {
        explorer = {
          enabled = true,
          auto_close = true,
          layout = {
            layout = {
              box = "horizontal",
              width = 0.8,
              min_width = 120,
              height = 0.8,
              {
                box = "vertical",
                border = true,
                title = "{title} {live} {flags}",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
              { win = "preview", title = "{preview}", border = true, width = 0.5 },
            },
          },
        }, -- Explorer picker: use default setting
        -- files = { hidden = true, ignored = false },
      },
    },
    words = { enabled = false },
  },
}
