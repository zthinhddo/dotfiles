local ok, schemastore = pcall(require, "schemastore")

---@type vim.lsp.Config
return {
  settings = {
    yaml = {
      schemaStore = {
        -- Disable built-in schemaStore to use SchemaStore.nvim instead
        enable = false,
        url = "",
      },
      schemas = ok and schemastore.yaml.schemas() or {},
    },
  },
}
