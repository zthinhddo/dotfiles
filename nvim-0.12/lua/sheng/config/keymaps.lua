-- Code action
vim.keymap.set('n', '<leader>co', function()
  vim.lsp.buf.code_action({
    context = {
      only = {
	"source.organizeImports"
      },
      diagnostics = {}
    },
    apply = true
  })
end, { silent = true, desc = "Organize Imports" })
