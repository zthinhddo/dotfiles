-- LSP
vim.keymap.set(
  { "i" },
  "<C-n>",
  "<C-x><C-o>",
  { desc = "Autocompletion select options", noremap = true }
)

-- Yanking
vim.keymap.set(
  "x",
  "p",
  "pgvy",
  { desc = "Paste from registry" }
)

-- Mason
vim.keymap.set(
  "n",
  "<leader>cm",
  "<cmd>Mason<cr>",
  { desc = "Open Mason UI" }
)

-- =========== Conform ===========
local nvim_conform = require("conform")
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    nvim_conform.format({ bufnr = args.buf })
  end,
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  nvim_conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })
-- =========== Conform ===========

-- Colorscheme
vim.cmd("colorscheme rose-pine")

-- Tmux navigation
local nvim_tmux_nav = require("nvim-tmux-navigation")
vim.keymap.set(
  "n",
  "<C-h>",
  nvim_tmux_nav.NvimTmuxNavigateLeft
)
vim.keymap.set(
  "n",
  "<C-j>",
  nvim_tmux_nav.NvimTmuxNavigateDown
)
vim.keymap.set(
  "n",
  "<C-k>",
  nvim_tmux_nav.NvimTmuxNavigateUp
)
vim.keymap.set(
  "n",
  "<C-l>",
  nvim_tmux_nav.NvimTmuxNavigateRight
)

-- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
  telescope_builtin.find_files()
end)
vim.keymap.set(
  "n",
  "<leader>fg",
  telescope_builtin.git_files,
  { desc = "Telescope find git files" }
)
vim.keymap.set(
  "n",
  "<leader>fb",
  telescope_builtin.buffers,
  { desc = "Telescope find all buffers" }
)
vim.keymap.set(
  "n",
  "<leader>fw",
  telescope_builtin.live_grep,
  { desc = "Telescope by words while typing" }
)
vim.keymap.set("n", "<leader>nc", function()
  telescope_builtin.find_files({
    cwd = vim.fn.stdpath("config"),
  })
end)
vim.keymap.set(
  "n",
  "gD",
  telescope_builtin.lsp_definitions,
  { desc = "Go to definitions" }
)
vim.keymap.set(
  "n",
  "gd",
  telescope_builtin.lsp_references,
  { desc = "Go to references" }
)

-- ========== Linting ==========
local lint_augroup =
  vim.api.nvim_create_augroup("lint", { clear = true })
local lint = require("lint")
vim.api.nvim_create_autocmd(
  { "BufEnter", "BufWritePost", "InsertLeave" },
  {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end,
  }
)
-- ========== Linting ==========

-- ========== Todo Comment ==========
local todo_comment = require("todo-comments")
vim.keymap.set(
  "n",
  "td",
  "<cmd>TodoTelescope<cr>",
  { desc = "Next todo comment" }
)
-- ========== Todo Comment ==========

-- ========== Neotree ==========
vim.keymap.set(
  "n",
  "<leader>e",
  "<cmd>Neotree toggle reveal<cr>",
  { desc = "Open current dir with Neo-tree" }
)
vim.keymap.set("n", "<leader>bd", "<cmd>Bdelete<cr>", {
  desc = "Delete current buffer and switch to another availale buffer",
})
vim.keymap.set(
  "n",
  "<leader>s",
  "<cmd>Neotree float git_status<cr>",
  { desc = "Open git status with Neo-tree" }
)
-- ========== Neotree ==========

-- ========== Code Action ==========
vim.keymap.set(
  "n",
  "<leader>ca",
  "<cmd>lua vim.lsp.buf.code_action()<cr>",
  { desc = "Open code action selection to imports" }
)

-- ==== Toggle Term ====
vim.keymap.set(
  "n",
  "<C-\\>",
  "<cmd>ToggleTerm direction=float size=50<cr>",
  { desc = "Open terminal in float style" }
)

vim.keymap.set(
  "t",
  "<C-\\>",
  "<cmd>ToggleTerm<cr>",
  { desc = "Hidden terminal in float style" }
)
-- ==== Toggle Term ====

-- ==== Bufferline =====
vim.keymap.set(
  "n",
  "L",
  "<cmd>bn<cr>",
  { desc = "To next buffer" }
)

vim.keymap.set(
  "n",
  "H",
  "<cmd>bN<cr>",
  { desc = "To previous buffer" }
)
