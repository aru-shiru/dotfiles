local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "json",
    "vue",
    "php",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "emmet-lsp",
    "html-lsp",
    "typescript-language-server",
    "vue-language-server",
    "tailwindcss-language-server",
    "json-lsp",
    "deno",
    "prettier",
    "intelephese",
    "phpactor",
  },
}

return M