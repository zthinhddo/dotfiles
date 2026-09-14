-- All colorschemes (enabled, disabled) go here

local M = {}
M.config = {
  theme = "wave",
  colors = {
    theme = {
      all = {
	ui = {
	  bg_gutter = "none" -- remove the grey ugly bg from the gutter
	}
      }
    }
  }
}

require("kanagawa").setup(M.config)
vim.cmd("colorscheme kanagawa")
