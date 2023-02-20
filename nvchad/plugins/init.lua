return {
  -- disable terminal plugin
  ["NvChad/nvterm"] = false,

  -- disable welcome screen plugin
  ["goolord/alpha-nvim"] = false,

  -- disable tab
  ["NvChad/ui"] = {
    override_options = {
      tabufline = {
        enabled = false
      },
    },
  },

  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "vue-language-server",
        "emmet-ls",
        "json-lsp",

        -- flutter dev
        "dartls",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["tpope/vim-fugitive"] = {},

  ["kylechui/nvim-surround"] = {
    tag = "*",
    config = function()
      require "nvim-surround".setup()
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["sindrets/diffview.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require "diffview".setup({
        use_icons = true
      })
    end,
  },

  ["akinsho/git-conflict.nvim"] = {
    tag = "*",
    config = function()
      require "git-conflict".setup()
    end,
  },

  ["akinsho/flutter-tools.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require "flutter-tools".setup()
    end,
  },
}
