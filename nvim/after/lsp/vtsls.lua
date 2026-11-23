---@type vim.lsp.Config
return {
  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = { completeFunctionCalls = true },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = false },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = false },
        variableTypes = { enabled = false },
      },
      tsserver = {
        watchOptions = {
          excludeDirectories = {
            "**/.next/**",
            "**/node_modules/**",
          },
        },
      },
    },
    javascript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = { completeFunctionCalls = true },
      inlayHints = {
        enumMemberValues = { enabled = true },
        parameterNames = { enabled = "literals" },
      },
    },
  },
}
