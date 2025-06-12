-- https://github.com/craftzdog/solarized-osaka.nvim?ref=devas.life
return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  enabled = false,
  config = function()
    require("solarized-osaka").setup({
      transparent = {
        enabled = true, -- Master switch to enable transparency
        pmenu = true, -- Popup menu (e.g., autocomplete suggestions)
        normal = true, -- Main editor window background
        normalfloat = true, -- Floating windows
        neotree = true, -- Neo-tree file explorer
        nvimtree = true, -- Nvim-tree file explorer
        whichkey = true, -- Which-key popup
        telescope = true, -- Telescope fuzzy finder
        lazy = true, -- Lazy plugin manager UI
        mason = true, -- Mason manage external tooling
      },
    })
  end,
}
