local opts = vim.opt

-- opts.number = true -- show line number
opts.relativenumber = true -- line number style
opts.clipboard = "unnamedplus"
opts.termguicolors = true
opts.shell = "/usr/bin/bash"
opts.mousescroll = "ver:6,hor:6"
opts.shiftwidth = 2

-- git blamer
vim.g.blamer_enabled = true
