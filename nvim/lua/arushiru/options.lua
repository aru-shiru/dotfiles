-- turn on syntax highlighting
vim.opt.syntax = enable

-- show line number
vim.opt.number = true

-- use relative number
vim.opt.relativenumber = true

-- set default split placement
vim.opt.splitbelow = true
vim.opt.splitright = true

-- always show what mode we're currently editing in
vim.opt.showmode = true

-- highlight search result
vim.opt.hlsearch = true

-- search as you type
vim.opt.incsearch = true

-- disable annoying bell sound
vim.cmd "set noerrorbells visualbell t_vb="

-- automatically write file when switching
vim.opt.autowriteall = true

-- do not continue comment
vim.cmd "set formatoptions-=cro"

-- set our desired autocomplete matching
vim.cmd "set complete=.,w,b,u"

-- a tab is 4 spaces
vim.opt.tabstop = 4

-- use spaces instead of tab
vim.opt.expandtab = true

-- use 4 spaces for tabs in insert mode
vim.opt.softtabstop = 4

-- use 4 spaces for indentation in normal mode
vim.opt.shiftwidth = 4
