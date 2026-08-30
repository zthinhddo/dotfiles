return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      -- Remove markdownlint from the markdown filetype mapping
      opts.linters_by_ft.markdown = nil
    end,
  },
}
