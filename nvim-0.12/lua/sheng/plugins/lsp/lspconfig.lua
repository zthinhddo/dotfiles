--- TYEPSCRIPT/JAVASCRIPT -----------------------
--- LSP Config (ts_ls): https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls
vim.lsp.config['ts_ls'] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_markers = { "tsconfig.json", "package.json", ".git" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = false,
        includeInlayEnumMemberValueHints = true,
      }
    }
  }
}

vim.lsp.enable("ts_ls")
vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())



--- LUA -----------------------------------------
--- LSP Config (lua_ls): https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
vim.lsp.config['lua_ls'] = {
  cmd = { vim.env.HOME .. "/.local/share/lua-language-server/bin/lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luacheckrc", ".stylua.toml", "selene.toml", ".git", "init.lua" },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      }
    }
  }
}

vim.lsp.enable("lua_ls")

