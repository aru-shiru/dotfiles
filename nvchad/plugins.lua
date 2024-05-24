local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- disable terminal plugin
  { "NvChad/nvterm", enabled = false },

  -- syntax highligting
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },

  -- lsp servers
  { "williamboman/mason.nvim", opts = overrides.mason },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/schemastore.nvim",
      { 
        "jose-elias-alvarez/null-ls.nvim", 
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      "jayp0521/mason-null-ls.nvim",
    },
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },

  -- Add, change, and delete surrounding text.
  { "tpope/vim-surround" },

  -- Useful commands like :Rename and :SudoWrite.
  { "tpope/vim-eunuch" },

  -- Pairs of handy bracket mappings, like [b and ]b.
  { "tpope/vim-unimpaired" },
  
  -- Indent autodetection with editorconfig support.
  { "tpope/vim-sleuth" },

  -- Allow plugins to enable repeating of commands.
  { "tpope/vim-repeat" },

  -- Jump to the last location when opening a file.
  { "farmergreg/vim-lastplace" },

  -- Enable * searching with visually selected text.
  { "nelstrom/vim-visual-star-search" },

  -- Automatically create parent dirs when saving.
  { "jessarcher/vim-heritage" },

  -- Text objects for HTML attributes.
  { "whatyouhide/vim-textobj-xmlattr", dependencies = "kana/vim-textobj-user" },

  -- Automatically add closing brackets, quotes, etc.
  { "windwp/nvim-autopairs", config = true },

  -- Add smooth scrolling to avoid jarring jumps
  { "karb94/neoscroll.nvim", config = true },

  -- Git commands.
  { "tpope/vim-fugitive", dependencies = "tpope/vim-rhubarb" },

  -- Firebase
  { "delphinus/vim-firestore", ft = "rules" },

  -- All closing buffers without closing the split window.
  { 
    "famiu/bufdelete.nvim",
    keys = { "<leader>q", "<leader>Q" },
    config = function()
      require("core.utils").load_mappings "bufdelete"
    end, 
  },

  -- Split arrays and methods onto multiple lines, or join them back up.
  {
    "AndrewRadev/splitjoin.vim",
    keys = { "gS", "gJ" },
    config = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_php_method_chain_full = 1
    end,
  },

  -- Automatically set the working directory to the project root.
  {
    "airblade/vim-rooter",
    init = function()
      -- Instead of this running every time we open a file, we"ll just run it once when Vim starts.
      vim.g.rooter_manual_only = 1
      vim.g.rooter_patterns = {".git", "composer.json"}
    end,
    config = function()
      vim.cmd("Rooter")
    end,
  },

  -- Automatically fix indentation when pasting code.
  {
    "sickill/vim-pasta",
    config = function()
      vim.g.pasta_disabled_filetypes = { "fugitive" }
    end,
  },

  -- Single tabpage interface for easily cycling through diffs for all modified files 
  { 
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require "diffview".setup({
        use_icons = true
      })
    end,
  },

  -- visualise and resolve conflicts
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require "git-conflict".setup()
    end,
  },
}

return plugins
