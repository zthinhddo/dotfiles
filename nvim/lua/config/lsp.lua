-- Native Neovim 0.12 diagnostic configuration (replaces deprecated sign_define)
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

-- Native Neovim 0.12 LspAttach setup
-- Global defaults already provided by Neovim 0.12:
--   K (hover), gra (code action), grn (rename), grr (references),
--   gri (implementation), grt (type definition), gO (document symbols), <C-s> (signature help)
local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  desc = "Configure native Neovim 0.12 LSP completion, inline completion, and buffer keymaps",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end
    local bufnr = args.buf

    local function bmap(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    -- Enable native LSP trigger-character completion (e.g. '.', ':', '/')
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    -- Enable native Neovim 0.12 inline completion (e.g. GitHub Copilot LSP)
    if client:supports_method("textDocument/inlineCompletion") and vim.lsp.inline_completion then
      vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
      bmap("n", "<leader>ui", function()
        local enabled = vim.lsp.inline_completion.is_enabled({ bufnr = bufnr })
        vim.lsp.inline_completion.enable(not enabled, { bufnr = bufnr })
        vim.notify("Inline completion " .. (enabled and "disabled" or "enabled"), vim.log.levels.INFO)
      end, "Toggle inline completion")
    end

    -- Inlay hints toggle
    if client:supports_method("textDocument/inlayHint") then
      bmap("n", "<leader>uh", function()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
        vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
      end, "Toggle inlay hints")
    end

    -- Ergonomic buffer-local LSP keymaps (complementing 0.12 gr* defaults)
    bmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
    bmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    bmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
    bmap("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
    bmap("n", "<leader>cl", "<cmd>checkhealth vim.lsp<cr>", "LSP status")
    bmap("n", "<leader>co", function()
      vim.lsp.buf.code_action({
        context = {
          only = { "source.organizeImports" },
          diagnostics = {},
        },
        apply = true,
      })
    end, "Organize imports")
  end,
})
