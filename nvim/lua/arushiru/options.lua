local opt = vim.opt

-- disable netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- turn on syntax highlighting
opt.syntax = 'on'

-- show line number
opt.number = true

-- use relative number
opt.relativenumber = true

-- set default split placement
opt.splitbelow = true
opt.splitright = true

-- always show what mode we're currently editing in
opt.showmode = true

-- highlight search result
opt.hlsearch = false

-- search as you type
opt.incsearch = false

-- automatically write file when switching
opt.autowriteall = true

-- disable annoying bell sound
vim.cmd "set noerrorbells visualbell t_vb="

-- do not continue comment
vim.cmd "set formatoptions-=cro"

-- set our desired autocomplete matching
vim.cmd "set complete=.,w,b,u"

-- set line height
opt.linespace = 3

-- a tab is 4 spaces
opt.tabstop = 4

-- use spaces instead of tab
opt.expandtab = true

-- use 4 spaces for tabs in insert mode
opt.softtabstop = 4

-- use 4 spaces for indentation in normal mode
opt.shiftwidth = 4

-- Enable mouse mode
opt.mouse = 'a'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.updatetime = 250
opt.signcolumn = 'yes'

-- Set colorscheme
opt.termguicolors = true

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

opt.smartindent = true

-- Do not wrap the text
opt.wrap = false

-- complete the longest common match, and allow tabbing the results to fully complete them
opt.wildmode = 'longest:full,full'

opt.title = true

-- enable the below listchars
opt.list = true
opt.listchars = { tab = '▸ ', trail = '.' }
opt.fillchars:append({ eob = ' ' })

-- create split below
opt.splitbelow = true

-- create split on right side for vertical split
opt.splitright = true

opt.scrolloff = 10

opt.sidescrolloff = 8

-- Use Linux system clipboard
opt.clipboard = 'unnamedplus'

-- ask for confirmation instead of erroring
opt.confirm = true

-- persistent undo
opt.undofile = true

-- automatically save a backup file
opt.backup = true

-- keep backups out of the current directory
opt.backupdir:remove('.')
