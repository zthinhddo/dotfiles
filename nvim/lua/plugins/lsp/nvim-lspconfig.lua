local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- This one disable the warning for vim global variable
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
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports",
        },
      },
    })
  end,
}
