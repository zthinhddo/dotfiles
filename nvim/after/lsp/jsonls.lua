local ok, schemastore = pcall(require, "schemastore")

---@type vim.lsp.Config
return {
  settings = {
    json = {
      schemas = ok and schemastore.json.schemas() or {},
      validate = { enable = true },
    },
  },
}
