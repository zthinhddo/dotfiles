local ensure_installed = {
  "bash",
  "c",
  "css",
  "diff",
  "dockerfile",
  "gitignore",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup()

    -- Install only missing parsers so startup stays fast
    local installed = {}
    for _, lang in ipairs(ts.get_installed()) do
      installed[lang] = true
    end

    local missing = vim.tbl_filter(function(lang)
      return not installed[lang]
    end, ensure_installed)

    if #missing > 0 then
      ts.install(missing)
    end
  end,
}
