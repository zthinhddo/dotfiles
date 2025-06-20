return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      -- logging as warning type is set by defaults
      filetype = {
        lua = {
          -- Lua configuration
          require("formatter.filetypes.lua").stylua(),
        },
        javascript = {
          require("formatter.filetypes.javascript").prettiereslint(),
        },
        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettiereslint(),
        },
        typescript = {
          require("formatter.filetypes.typescript").prettiereslint(),
        },
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettiereslint(),
        },
      },
    })
  end,
}
