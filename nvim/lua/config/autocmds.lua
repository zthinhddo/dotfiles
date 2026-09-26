-- ============================================================================
-- AUTO COMMANDS
-- ============================================================================
O = vim.opt

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt_local.formatoptions:remove({ "o", "r", "c" })
  end,
})

-- Remove annoying auto comment everytime entering newline
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  callback = function()
    O.formatoptions:remove({ "r", "o" })
  end,
})

-- Removing search highlight when entering Insert mode.
vim.api.nvim_create_autocmd("InsertEnter", {
  group = augroup,
  pattern = "*",
  callback = function()
    -- Clear search highlight (Deferred)
    vim.schedule(function()
      vim.cmd("nohlsearch")
    end)
  end,
  desc = "Trigger multiple actions upon entering Insert mode",
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.hl.on_yank({ higroup = "Visual", timeout = 300 })
  end,
})

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  desc = "Restore last cursor position",
  callback = function()
    if vim.o.diff then -- except in diff mode
      return
    end

    local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
    local last_line = vim.api.nvim_buf_line_count(0)

    local row = last_pos[1]
    if row < 1 or row > last_line then
      return
    end

    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end,
})

-- Spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-------------------------------------------------
-- Custom keymaps
-------------------------------------------------
vim.keymap.set("n", "<leader>pa", function() -- show file path
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end, { desc = "Copy full file path" })

-------------------------------------------------
-- Custom Highlights
-------------------------------------------------
