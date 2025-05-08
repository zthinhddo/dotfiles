return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "markdown",
        "css",
        "dockerfile",
        "graphql",
        "html",
        "javascript",
        "json",
        "proto",
        "sql",
        "tsx",
        "typescript",
        "yaml",
        "xml",
        "bash",
        "regex",
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(
            vim.loop.fs_stat,
            vim.api.nvim_buf_get_name(buf)
          )
          return ok and stats and stats.size > max_filesize
        end,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
