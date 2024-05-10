-- tab width (in spaces)
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- smart alignment when inserting tab in front of line
vim.opt.smarttab = true

-- expand tabs to spaces
vim.opt.expandtab = true

-- always show line numbering
vim.opt.number = true

-- line numbering relative to cursor
vim.opt.relativenumber = true

-- enable 24 bit colors in TUI
vim.opt.termguicolors = true

-- set font size for GUI nvim clients
vim.opt.guifont = "FiraCode Nerd Font:h11"

-- always show status bar
vim.opt.laststatus = 2

-- use system clipboard for all operations
vim.opt.clipboard:append { "unnamedplus" }
