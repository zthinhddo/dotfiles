-- Load Lazy plugins init state
require("config.lazy")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup(
    "kickstart-highlight-yank",
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable auto-commenting on newline",
  callback = function()
    vim.opt_local.formatoptions = vim.opt_local.formatoptions
      - "c" -- auto-wrap comments using textwidth
      - "r" -- continue comments when pressing Enter
      - "o" -- continue comments when using 'o' or 'O'
  end,
})
