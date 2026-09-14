local gh = function(name) return "https://github.com/" .. name end

-------------------------------------------------
-- PLUGINS
--------------------------------------------------
---Colorschemes
vim.pack.add({ gh("rebelot/kanagawa.nvim") })

-- Core Lib
vim.pack.add({ gh("nvim-lua/plenary.nvim") })
vim.pack.add({ gh("MunifTanjim/nui.nvim") })
vim.pack.add({ gh("echasnovski/mini.icons") })

-- Syntax & Parsing
vim.pack.add({ 
  { src = gh("nvim-treesitter/nvim-treesitter"), branch = "main" },
  { src = gh("nvim-treesitter/nvim-treesitter-textobjects"), branch = "main" },
  { src = gh("windwp/nvim-ts-autotag") }
})
