-- [[ Setting options ]]
-- See `:help vim.o`

-- disable netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- turn on syntax highlighting
vim.o.syntax = 'on'

-- show line number
vim.o.number = true

-- use relative number
vim.o.relativenumber = true

-- set default split placement
vim.o.splitbelow = true
vim.o.splitright = true

-- always show what mode we're currently editing in
vim.o.showmode = true

-- highlight search result
vim.o.hlsearch = false

-- search as you type
vim.o.incsearch = false

-- disable annoying bell sound
vim.cmd "set noerrorbells visualbell t_vb="

-- automatically write file when switching
vim.o.autowriteall = true

-- do not continue comment
vim.cmd "set formatoptions-=cro"

-- set our desired autocomplete matching
vim.cmd "set complete=.,w,b,u"

-- set line height
vim.o.linespace = 3

-- a tab is 4 spaces
vim.o.tabstop = 4

-- use spaces instead of tab
vim.o.expandtab = true

-- use 4 spaces for tabs in insert mode
vim.o.softtabstop = 4

-- use 4 spaces for indentation in normal mode
vim.o.shiftwidth = 4

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd[[colorscheme nord]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

