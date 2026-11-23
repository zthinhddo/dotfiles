-- CLI tools (formatters/linters) installed via Mason registry (non-LSP packages)
local ensure_tools = {
  "stylua",
  "prettierd",
  "prettier",
}

return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = {
      ui = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr.refresh(function()
        for _, tool in ipairs(ensure_tools) do
          local ok, pkg = pcall(mr.get_package, tool)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end)
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "vtsls",
        "lua_ls",
        "tailwindcss",
        "ruff",
        "basedpyright",
        "copilot",
        "dockerls",
        "docker_compose_language_service",
        "jsonls",
        "yamlls",
      },
      -- Automatically invokes native vim.lsp.enable() for installed servers
      automatic_enable = true,
    },
  },
}
