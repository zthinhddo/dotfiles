-- space bar as leader key
vim.g.mapleader = " "

-- LSP
vim.api.nvim_set_keymap(
  "n",
  "gD",
  "<cmd>lua vim.lsp.buf.declaration()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "gd",
  "<cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true }
)

-- Mason
vim.keymap.set(
  "n",
  "<leader>cm",
  "<cmd>Mason<cr>",
  { desc = "Open Mason UI" }
)

-- Conform
local nvim_conform = require("conform")
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    nvim_conform.format({ bufnr = args.buf })
  end,
})

-- Colorscheme
vim.cmd("colorscheme gruvbox")

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
vim.keymap.set(
  "n",
  "<leader>ff",
  telescope_builtin.find_files,
  { desc = "Telescope find files" }
)
vim.keymap.set(
  "n",
  "<leader>fd",
  telescope_builtin.live_grep,
  { desc = "Telescope live grep" }
)
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
vim.keymap.set("n", "<leader>nc", function()
  telescope_builtin.find_files({
    cwd = vim.fn.stdpath("config"),
  })
end)
