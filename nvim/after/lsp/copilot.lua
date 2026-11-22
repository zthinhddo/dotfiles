-- Inherits cmd, root_markers, and :LspCopilotSignIn / :LspCopilotSignOut
-- from nvim-lspconfig's built-in lsp/copilot.lua
---@type vim.lsp.Config
return {
  settings = {
    telemetry = {
      telemetryLevel = "off",
    },
  },
}
