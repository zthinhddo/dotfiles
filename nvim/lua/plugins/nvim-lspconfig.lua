return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          {
            path = "${3rd}/luv/library",
            word = { "vim%.uv" },
          },
        },
      },
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local original_capabilities =
      vim.lsp.protocol.make_client_capabilities()
    local capabilities =
      require("blink.cmp").get_lsp_capabilities(
        original_capabilities
      )

    -- Install lsp server
    lspconfig.lua_ls.setup({})
    lspconfig.ts_ls.setup({})

    -- LSP Capabilities
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })
  end,
}
