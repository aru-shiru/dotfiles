require "nvchad.mappings"

local map = vim.keymap.set

-- general

map("i", "jj", "<ESC>", {
    desc = "use jj to escape"
})

map("n", "<ESC>", "<cmd> noh <CR>", {
    desc = "no highlight"
})

map("n", "<leader>w", ":bd<CR>", {
    desc = "close buffer"
})

map("i", "<C-o>", ":bnext<CR>", {
    desc = "switch to next buffer"
})

map("i", "<C-i>", ":bprev<CR>", {
    desc = "switch to previous buffer"
})

map("i", "<leader>k", ":nohlsearch<CR>", {
    desc = "clear search highlight"
})

map("v", "p", "_dP", {
    desc = "paste replace visual selection without copying it"
})





-- nvimtree

map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", {
    desc = "toggle nvimtree"
})





-- telescope

map("n", "gd", "<cmd> Telescope lsp_definitions <CR>", {
    desc = "Go to definitions"
})

map("n", "gi", "<cmd> Telescope lsp_implementations <CR>", {
    desc = "Go to impelementations"
})

map("n", "gr", "<cmd> Telescope lsp_references <CR>", {
    desc = "Go to references"
})





-- bufdelete

map("n", "<leader>q", ":Bdelete<CR>", {
    desc = "close open buffer"
})

map("n", "<leader>Q", ":bufdo Bdelete<CR>", {
    desc = "close all open buffers"
})