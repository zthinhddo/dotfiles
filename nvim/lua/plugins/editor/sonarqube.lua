return {
  "iamkarasik/sonarqube.nvim",
  config = function()
    local extension_path = vim.fn.stdpath("data") .. "/mason/packages/sonarlint-language-server/extension"
    require("sonarqube").setup({
      rules = {
        enabled = true,
      },
      javascript = {
        enabled = true,
        clientNodePath = vim.fn.exepath("node"),
      },
      lsp = {
        cmd = {
          vim.fn.exepath("java"),
          "-jar",
          extension_path .. "/server/sonarlint-ls.jar",
          "-stdio",
          "-analyzers",
          extension_path .. "/analyzers/sonarhtml.jar",
          extension_path .. "/analyzers/sonariac.jar",
          extension_path .. "/analyzers/sonarjs.jar",
          extension_path .. "/analyzers/sonartext.jar",
        },
      },
    })
  end,
}
