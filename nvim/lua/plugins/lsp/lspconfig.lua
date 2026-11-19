return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        watchFiles = {
          exclude = {
            "**/.next/**",
            "**/node_modules/**",
          },
        },
      },
    },
  },
}
