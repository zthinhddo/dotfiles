-------------------------------------------------
-- OPTIONS
-------------------------------------------------
local O = vim.opt
O.termguicolors = true -- true color support
O.clipboard = "unnamedplus" -- sync with system clipboard
O.completeopt = "menu,menuone,popup,noselect"
O.number = true
O.relativenumber = true
O.conceallevel = 1 -- Hide double * markup for bold and italic, not markers with substitution (replacement of cchar)
O.confirm = true -- confirm saving before existing
O.cursorline = true -- highlight the current line
O.formatexpr = "v:lua.vim.lsp.formatexpr()" -- keymap: gq. Use the current LSP client language to format
O.formatoptions = "jcroqlnt"
O.ignorecase = true -- Ignore case sensitive when search with \
O.inccommand = "nosplit" -- Show the effect while using command-line commands (e.g. search and replace,...)
O.jumpoptions = "view" -- Preserve original scroll position when jumping
O.wrap = false -- disable wrap text (display not the buffer)
O.mouse = "a"
O.pumblend = 15 -- basically opacity for the popup menu
O.scrolloff = 10 -- Lines of context. Feels good when scrolling vertically
O.sidescrolloff = 8 -- Columns of context. Feels good when scrolling horizontally
O.shiftwidth = 2
O.showmode = true
O.signcolumn = "yes" -- Always show when errors/warning appears
O.smartcase = true -- Don't ignore case with capitals
O.smartindent = true -- Insert indents automatically
O.smoothscroll = true
O.undofile = true -- enable undo tree
O.undolevels = 10000
O.wildmode = "longest:full,full" -- Command-line completion mode
O.autocomplete = true -- Open suggestion popup while typing


-- Use clipboard on Windows (require wl-clipboard)
vim.g.clipboard = {
  name = 'win32yank-wsl',
  copy = {
     ['+'] = 'win32yank.exe -i --crlf',
     ['*'] = 'win32yank.exe -i --crlf',
   },
  paste = {
     ['+'] = 'win32yank.exe -o --lf',
     ['*'] = 'win32yank.exe -o --lf',
  },
  cache_enabled = 0,
}

