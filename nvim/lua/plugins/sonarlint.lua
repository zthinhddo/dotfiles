return {
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  lazy = false,
  ft = { "javascript", "typescript" },
  config = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          vim.fn.expand(
            "$MASON/share/sonarlint-analyzers/sonarjs.jar"
          ),
        },
        settings = {
          sonarlint = {
            test = "test",
          },
        },
      },
      filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      },
      settings = {
        "typescript",
        "typescriptreact",
        "javascript",
        sonarlint = {
          rules = {
            ["typescript:S6019"] = { level = "on" },
            ["typescript:S6035"] = { level = "on" },
            ["typescript:S2933"] = { level = "on" },
            ["typescript:S1607"] = { level = "on" },
            ["typescript:S6079"] = { level = "on" },
            ["typescript:S106"] = { level = "on" },
          },
        },
      },
    })
  end,
}
