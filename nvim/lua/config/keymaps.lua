local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, desc)
end

-- Tmux navigator
local nvim_tmux_nav = require("nvim-tmux-navigation")
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- Harpoon
-- map("n", "<leader>H", require("harpoon.mark").add_file(), "Harpoon current file")
-- map("n", "<leader>h", require("harpoon.ui").toggle_quick_menu(), "Toglge harpoon file menu")
