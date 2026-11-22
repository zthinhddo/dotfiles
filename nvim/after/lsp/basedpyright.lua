---@type vim.lsp.Config
return {
  settings = {
    basedpyright = {
      -- Let ruff handle import organization and linting
      disableOrganizeImports = true,
      analysis = {
        typeCheckingMode = "standard",
      },
    },
  },
}
