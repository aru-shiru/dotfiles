local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- >>> NORMAL MODE <<<--

-- easier window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Quickly clear search highlighting.
keymap('n', '<leader>k', ':nohlsearch<CR>', opts)

-- close buffer
keymap("n", "<leader>w", ":bd<CR>", opts)

-- Close all open buffers.
keymap('n', '<leader>Q', ':bufdo bdelete<CR>', opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })





-- >>> INSERT MODE <<<--

-- Use jj to escape
keymap('i', 'jj', '<ESC>', opts)

-- Easy insertion of a trailing ; or , from insert mode.
keymap('i', ';;', '<Esc>A;<Esc>', opts)
keymap('i', ',,', '<Esc>A,<Esc>', opts)






-- >>> VISUAL MODE <<<--

-- Paste replace visual selection without copying it.
keymap('v', 'p', '"_dP', opts)

-- Reselect visual selection after indenting.
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap('v', 'y', 'myy`y', opts)
keymap('v', 'Y', 'myY`y', opts)

