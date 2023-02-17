local M = {}

M.general = {
  n = {
    ["<leader>w"] = { ":bd<CR>", "close buffer" },
    ["<C-o>"] = { ":bnext<CR>", "switch to next buffer" },
    ["<C-i>"] = { ":bprev<CR>", "switch to next buffer" },
  },
  i = {
    ["jj"] = { "<ESC>", "use jj to escape" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

return M
