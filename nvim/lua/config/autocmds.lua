local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Prevent automatic comment continuation on new lines
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  group = augroup,
  desc = "Disable automatic comment continuation",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Clear search highlight when entering Insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  group = augroup,
  desc = "Clear search highlight on InsertEnter",
  callback = function()
    vim.schedule(function()
      vim.cmd("nohlsearch")
    end)
  end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank({ higroup = "Visual", timeout = 250 })
  end,
})

-- Restore last cursor position when reopening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  desc = "Restore last cursor position",
  callback = function(args)
    if vim.o.diff then
      return
    end
    local exclude = { gitcommit = true, gitrebase = true }
    if exclude[vim.bo[args.buf].filetype] then
      return
    end

    local last_pos = vim.api.nvim_buf_get_mark(args.buf, '"')
    local last_line = vim.api.nvim_buf_line_count(args.buf)
    if last_pos[1] >= 1 and last_pos[1] <= last_line then
      pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
    end
  end,
})

-- Enable wrap and spellcheck on prose filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "text", "gitcommit" },
  desc = "Enable spellcheck and wrap for prose",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Close utility windows with 'q'
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "help", "qf", "checkhealth", "man", "lspinfo", "notify", "nvim-undotree" },
  desc = "Close utility buffers with q",
  callback = function(args)
    vim.bo[args.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = args.buf, silent = true, desc = "Close window" })
  end,
})

-- Auto-resize splits when terminal window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  desc = "Equalize splits on resize",
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Auto-create missing parent directories when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  desc = "Create parent directories before saving",
  callback = function(args)
    if args.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(args.match) or args.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Enable native Neovim 0.12 Treesitter highlighting, folding, and indent
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  desc = "Start native Treesitter highlighting, folding, and indent",
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      vim.wo[0][0].foldmethod = "expr"
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      if pcall(require, "nvim-treesitter") then
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end
  end,
})

-- Custom Snacks dashboard header highlight across colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup,
  pattern = "*",
  desc = "Style Snacks dashboard header",
  callback = function()
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader", {
      fg = "#BD0F72",
      bold = true,
      force = true,
    })
  end,
})
