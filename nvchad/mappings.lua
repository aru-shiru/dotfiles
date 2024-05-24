local M = {}

M.general = {
  i = {
    ["jj"] = { "<ESC>", "use jj to escape" },
  },

  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },
    ["<leader>w"] = { ":bd<CR>", "close buffer" },
    ["<C-o>"] = { ":bnext<CR>", "switch to next buffer" },
    ["<C-i>"] = { ":bprev<CR>", "switch to previous buffer" },
    ["<leader>k"] = { ":nohlsearch<CR>", "clear search highlight" },
  },

  v = {
    ["p"] = { "_dP", "paste replace visual selection without copying it" },
  }
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- lsp
    ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "Go to definitions" },
    ["gi"] = { "<cmd> Telescope lsp_implementations <CR>", "Go to impelementations" },
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "Go to references" },
  },
}

M.bufdelete = {
  n = {
    ["<leader>q"] = { ":Bdelete<CR>", "close open buffer" },
    ["<leader>Q"] = { ":bufdo Bdelete<CR>", "close all open buffers" },
  }
}

return M
