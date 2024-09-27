-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<C-a>", "gg<S-v>G", opts)
keymap.set("n", "<C-b>", "va{", opts)

keymap.set("n", "<C-n>", ":BufferLineCycleNext<CR>", opts)
keymap.set("n", "<C-A-n>", ":BufferLineCyclePrev<CR>", opts)
