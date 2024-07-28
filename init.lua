local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

local opts = {
  noremap = true,
  silent = true,
}

-- Common key
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', opts)
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>', opts)

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)
