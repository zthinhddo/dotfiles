local kanagawa_colors = require("kanagawa.colors").setup({ theme = "dragon" })
local palette = kanagawa_colors.palette

-- 2. Construct the Lualine theme table
local kanagawa = {}
kanagawa = {
  normal = {
    -- Section A: Primary mode indicator (Leftmost)
    a = { bg = palette.dragonYellow, fg = palette.sumiInk0, gui = "bold" },
    -- Section B: Branch/Diff information
    b = { bg = palette.sumiInk4, fg = palette.fujiWhite },
    -- Section C: Filename and empty space
    c = { bg = palette.sumiInk1, fg = palette.oldWhite },
  },
  insert = {
    a = { bg = palette.dragonGreen2, fg = palette.sumiInk0, gui = "bold" },
    b = { bg = palette.sumiInk4, fg = palette.fujiWhite },
    c = { bg = palette.sumiInk1, fg = palette.oldWhite },
  },
  visual = {
    a = { bg = palette.dragonBlue2, fg = palette.sumiInk0, gui = "bold" },
    b = { bg = palette.sumiInk4, fg = palette.fujiWhite },
    c = { bg = palette.sumiInk1, fg = palette.oldWhite },
  },
  replace = {
    a = { bg = palette.autumnRed, fg = palette.sumiInk0, gui = "bold" },
    b = { bg = palette.sumiInk4, fg = palette.fujiWhite },
    c = { bg = palette.sumiInk1, fg = palette.oldWhite },
  },
  command = {
    a = { bg = palette.surimiOrange, fg = palette.sumiInk0, gui = "bold" },
    b = { bg = palette.sumiInk4, fg = palette.fujiWhite },
    c = { bg = palette.sumiInk1, fg = palette.oldWhite },
  },
  inactive = {
    a = { bg = palette.sumiInk1, fg = palette.fujiGray },
    b = { bg = palette.sumiInk1, fg = palette.fujiGray },
    c = { bg = palette.sumiInk0, fg = palette.fujiGray },
  },
}
return kanagawa
