-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- buffers
map("n", "tk", "<cmd>blast<cr>", opts)
map("n", "tj", "<cmd>bfirst<cr>", opts)
map("n", "th", "<cmd>bprev<cr>", opts)
map("n", "tl", "<cmd>bnext<cr>", opts)
map("n", "td", "<cmd>bdelete<cr>", opts)
-- files
map("n", "QQ", ":q!<enter>", opts)
map("n", "WW", ":wq<enter>", opts)
-- editor
map("n", "<C-a>", "gg<S-v>G", opts)
map("n", "E", "$", opts)
map("n", "B", "^", opts)
map("v", "E", "$", opts)
map("v", "B", "^", opts)
-- map("n", "<A-u>", "<C-u>zz", opts)
-- map("n", "<A-d>", "<C-d>zz", opts)
map("n", "<A-u>", "<C-u>", opts)
map("n", "<A-d>", "<C-d>", opts)
map("i", "<C-BS>", "<C-w>", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
