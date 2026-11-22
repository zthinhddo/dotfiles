local function map(mode, lhs, rhs, opts)
  if type(opts) == "string" then
    opts = { desc = opts }
  end
  opts = vim.tbl_extend("force", { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")

-- Centered navigation
map("n", "n", "nzzzv", "Next search match (centered)")
map("n", "N", "Nzzzv", "Previous search match (centered)")
map("n", "<C-d>", "<C-d>zz", "Half page down (centered)")
map("n", "<C-u>", "<C-u>zz", "Half page up (centered)")
map("n", "G", "Gzz", "Go to bottom (centered)")

-- Better indenting in visual mode
map("v", "<", "<gv", "Indent left")
map("v", ">", ">gv", "Indent right")

-- Move lines up / down
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", "Move line down")
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", "Move line up")
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", "Move selection down")
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "Move selection up")

-- Delete without yanking
map({ "n", "v" }, "<leader>d", '"_d', "Delete without yanking")

-- Copy full file path
map("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied path: " .. path, vim.log.levels.INFO)
end, "Copy full file path")

-- Window management
map("n", "<leader>wv", "<C-w>v", "Vertical split")
map("n", "<leader>ws", "<C-w>s", "Horizontal split")
map("n", "<leader>wd", "<C-w>c", "Close window")
map("n", "<C-Up>", "<cmd>resize +2<cr>", "Increase window height")
map("n", "<C-Down>", "<cmd>resize -2<cr>", "Decrease window height")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", "Decrease window width")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", "Increase window width")

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", "Previous buffer")
map("n", "<S-l>", "<cmd>bnext<cr>", "Next buffer")
map("n", "[b", "<cmd>bprevious<cr>", "Previous buffer")
map("n", "]b", "<cmd>bnext<cr>", "Next buffer")
map("n", "<leader>bb", "<cmd>e #<cr>", "Switch to alternate buffer")

-- Native Neovim 0.12 Diagnostics
map("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, "Next diagnostic")
map("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, "Previous diagnostic")
map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
map("n", "<leader>cq", vim.diagnostic.setqflist, "Diagnostics to quickfix")

-- Built-in Neovim 0.12 Undotree & Lazy UI
map("n", "<leader>uu", "<cmd>Undotree<cr>", "Toggle Undotree")
map("n", "<leader>L", "<cmd>Lazy<cr>", "Open Lazy")

-- Native Neovim 0.12 Insert Completion, Inline Completion (Copilot), and Snippets
map("i", "<C-Space>", "<C-x><C-o>", "Trigger LSP completion")

map("i", "<CR>", function()
  if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ "selected" }).selected ~= -1 then
    return "<C-y>"
  end
  return "<CR>"
end, { expr = true, desc = "Confirm selected completion or newline" })

map({ "i", "s" }, "<Tab>", function()
  if vim.lsp.inline_completion and vim.lsp.inline_completion.get() then
    return ""
  end
  if vim.snippet.active({ direction = 1 }) then
    vim.schedule(function()
      vim.snippet.jump(1)
    end)
    return ""
  end
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  end
  return "<Tab>"
end, { expr = true, desc = "Accept inline completion / next snippet / next item" })

map({ "i", "s" }, "<S-Tab>", function()
  if vim.snippet.active({ direction = -1 }) then
    vim.schedule(function()
      vim.snippet.jump(-1)
    end)
    return ""
  end
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  end
  return "<S-Tab>"
end, { expr = true, desc = "Previous snippet / previous item" })

map("i", "<M-]>", function()
  if vim.lsp.inline_completion then
    vim.lsp.inline_completion.select({ count = 1 })
  end
end, "Next inline completion")

map("i", "<M-[>", function()
  if vim.lsp.inline_completion then
    vim.lsp.inline_completion.select({ count = -1 })
  end
end, "Previous inline completion")
