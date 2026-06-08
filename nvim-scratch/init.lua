-- local util = require("sheng.util")

vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin")
-- ============================================================================
-- GLOBAL VARIABLES & FUNCTIONS
-- ============================================================================
O = vim.opt
G = vim.g
-- ============================================================================
-- OPTIONS
-- ============================================================================
O.number = true			-- show line number
O.relativenumber = true
O.cursorline = true		-- highlight current line
O.tabstop = 2			-- 1 tab = 2 spaces
O.shiftwidth = 2
O.ignorecase = true
O.smartcase = true -- Use case insensitive if uppercase in string
O.showmatch = true -- Highlight matched brackets
O.hlsearch = true
O.incsearch = true -- show matches when type
O.signcolumn = "auto" -- Always show: Git, Diagnostic output,...
O.completeopt = "fuzzy,menuone,noinsert,noselect"
O.showmode = false -- show mode for NORMAL, INSERT or VISUAL
O.mouse = "a"
O.clipboard:append("unnamedplus") -- use system clipboard
O.encoding = "UTF-8" -- set encoding
O.autocomplete = true -- Auto completion
O.autocompletedelay = 500
O.wildmenu = true
O.wildmode = "longest:full,full" -- complete, longest command match, full completion list, cycle through with Tab
-- ============================================================================


-- ============================================================================
-- AUTO COMMANDS
-- ============================================================================
function map(mode, key, command, desc)
	vim.keymap.set(mode, key, command, desc)
end

-- Remove annoying auto comment everytime entering newline
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  group = augroup,
  callback = function()
	  O.formatoptions:remove({'r', 'o'})
  end
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
		vim.hl.on_yank({ higroup="Visual", timeout=1000 })
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
-- ============================================================================

-- ============================================================================
-- KEYMAPS
-- ============================================================================
G.mapleader = " "
G.maplocalleader = " "
-- QoL
map("n", "<leader>l", ":nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "n", "nzzzv", { desc = "Go to next search result, center the screen, unfold the function if any" })
map("n", "N", "Nzzzv", { desc = "Go to previous search result, center the screen, unfold the function if any" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
map("n", "<S-G>", "<S-G>zz", { desc = "Go down to last line of a buffer and center the screen" })
map({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- TMUX
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Move to left window/pane" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Move to bottom window/pane" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Move to top window/pane" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Move to right window/pane" })

-- Custom
vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })
-- ============================================================================

-- ============================================================================
-- PLUGINS (vim.pack)
-- ============================================================================
local function packadd(name) 
	vim.cmd("packadd " .. name)
end

-- INSTALL PLUGINS
-- Nvim Tree
vim.pack.add({
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	"https://www.github.com/nvim-tree/nvim-web-devicons",
})
-- ============================================================================

-- ============================================================================
-- PLUGINS CONFIGS
-- ============================================================================
require("nvim-tree").setup({
	view = {
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = function()
				-- Fetch current global screen dimensions
        local screen_w = vim.o.columns
        local screen_h = vim.o.lines - vim.o.cmdheight
        
        -- Define floating window size (80% of screen width and height)
        local window_w = math.floor(screen_w * 0.5)
        local window_h = math.floor(screen_h * 0.8)
        
        -- Calculate coordinates to center the window perfectly
        local center_x = math.floor((screen_w - window_w) / 2)
        local center_y = math.floor((screen_h - window_h) / 2)
        
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w,
          height = window_h,
        }
			end
		},
	},
	filters = {
		dotfiles = true
	},
	renderer = {
		group_empty = true
	},
})
vim.keymap.set("n", "<leader>e", function() 
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })
-- ============================================================================

