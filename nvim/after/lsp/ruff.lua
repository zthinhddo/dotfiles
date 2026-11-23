---@type vim.lsp.Config
return {
  on_attach = function(client)
    -- Defer hover to basedpyright to avoid duplicate hover popups
    client.server_capabilities.hoverProvider = false
  end,
}
