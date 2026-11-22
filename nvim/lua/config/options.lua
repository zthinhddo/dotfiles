local opt = vim.opt

-- Appearance & UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.signcolumn = "yes"
opt.winborder = "rounded" -- Neovim 0.12 native border for floating windows
opt.showmode = false -- Mode is displayed in lualine
opt.cmdheight = 0 -- Hide reserved cmdline row (handled dynamically by Neovim 0.12 ui2)
opt.laststatus = 3 -- Global statusline
opt.conceallevel = 1
opt.splitbelow = true
opt.splitright = true
opt.pumblend = 10
opt.pumheight = 12
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Editing & Indentation
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.smartindent = true
opt.wrap = false
opt.linebreak = true
opt.mouse = "a"
opt.undofile = true
opt.undolevels = 10000
opt.confirm = true
opt.updatetime = 200
opt.timeoutlen = 300
opt.formatoptions = "jqlnt"

-- Search & Scrolling
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.smoothscroll = true
opt.jumpoptions = "view"

-- Native Neovim 0.12 Autocompletion
opt.autocomplete = true
opt.autocompletedelay = 150
opt.completeopt = { "menu", "menuone", "popup", "noselect", "fuzzy" }
opt.complete = { ".", "w", "b", "o" } -- Buffer words + LSP omnifunc
opt.wildmode = "longest:full,full"

-- Folding (paired with native Treesitter foldexpr in autocmds.lua)
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Clipboard (sync with system clipboard; auto-detect WSL win32yank if present)
opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 and vim.fn.executable("win32yank.exe") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
