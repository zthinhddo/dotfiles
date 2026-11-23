-- Provides default lsp/<server>.lua definitions consumed natively by Neovim 0.12
-- Custom overrides live in after/lsp/<server>.lua
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}
