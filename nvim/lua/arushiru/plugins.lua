-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Color scheme
  { import = 'arushiru.plugins.tokyonight' },
  { "shaunsingh/oxocarbon.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },

  -- Commenting support.
  { import = 'arushiru.plugins.vim-commentary' },

  -- Add, change, and delete surrounding text.
  { 'tpope/vim-surround' },

  -- Useful commands like :Rename and :SudoWrite.
  { 'tpope/vim-eunuch' },

  -- Pairs of handy bracket mappings, like [b and ]b.
  { 'tpope/vim-unimpaired' },

  -- Indent autodetection with editorconfig support.
  { 'tpope/vim-sleuth' },

  -- Allow plugins to enable repeating of commands.
  { 'tpope/vim-repeat' },

  -- Jump to the last location when opening a file.
  { 'farmergreg/vim-lastplace' },

  -- Enable * searching with visually selected text.
  { 'nelstrom/vim-visual-star-search' },

  -- Automatically create parent dirs when saving.
  { 'jessarcher/vim-heritage' },

  -- Text objects for HTML attributes.
  { 'whatyouhide/vim-textobj-xmlattr', dependencies = 'kana/vim-textobj-user'  },

  -- Automatically set the working directory to the project root.
  { import = 'arushiru.plugins.vim-rooter' },

  -- Automatically add closing brackets, quotes, etc.
  { 'windwp/nvim-autopairs', config = true },

  -- Add smooth scrolling to avoid jarring jumps
  { 'karb94/neoscroll.nvim', config = true },

  -- All closing buffers without closing the split window.
  { import = 'arushiru.plugins.bufdelete' },

  -- Split arrays and methods onto multiple lines, or join them back up.
  { import = 'arushiru.plugins.splitjoin' },

  -- Automatically fix indentation when pasting code.
  { import = 'arushiru.plugins.vim-pasta' },

  -- Fuzzy finder
  { import = 'arushiru.plugins.telescope' },

  -- File tree sidebar
  { import = 'arushiru.plugins.nvim-tree' },

  -- A Status line.
  { import = 'arushiru.plugins.lualine' },

  -- Git integration.
  { import = 'arushiru.plugins.gitsigns' },

  -- Git commands.
  { 'tpope/vim-fugitive', dependencies = 'tpope/vim-rhubarb' },

  -- Improved syntax highlighting
  { import = 'arushiru.plugins.treesitter' },

  -- Language Server Protocol.
  { import = 'arushiru.plugins.lspconfig' },

  -- Completion
  { import = 'arushiru.plugins.cmp' },

  -- Colorize Hex Codes
  { import = 'arushiru.plugins.colorizer' },

  -- Firebase
  { 'delphinus/vim-firestore' }
})

vim.cmd('colorscheme rose-pine-main')
