vim.g.mapleader = " "

local opts = {
	noremap = true,
	silent = true,
}

local keymap = vim.keymap

-- toggle neotree
keymap.set("n", "<leader>e", ":Neotree toggle<CR>", opts)

keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)

keymap.set("i", "<C-h>", "<Left>", opts)
keymap.set("i", "<C-l>", "<Right>", opts)
keymap.set("i", "<C-k>", "<Up>", opts)
keymap.set("i", "<C-j>", "<Down>", opts)

keymap.set("n", "<C-b>", "va{", opts)

keymap.set("n", "<C-left>", function()
	vim.cmd("vertical resize -5")
end, opts)
keymap.set("n", "<C-right>", function()
	vim.cmd("vertical resize +5")
end, opts)

-- bufferline
keymap.set("n", "<C-n>", ":BufferLineCycleNext<CR>", opts)
keymap.set("n", "<C-A-n>", ":BufferLineCyclePrev<CR>", opts)
keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)
keymap.set("n", "<leader>bD", ":BufferLineCloseOthers<CR>", opts)

-- fzflua
keymap.set("n", "<leader><leader>", ":FzfLua files<CR>", opts)
keymap.set("n", "<leader>sg", function()
	require("fzf-lua").grep({ search = "" })
end, opts)

keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, opts) -- Go to definition
keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Go to references
keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show hover documentation

keymap.set("n", "<C-a>", "ggVG", opts)
keymap.set("n", "<C-s>", ":w<CR>", opts)
keymap.set("i", "<C-s>", "<Esc>:w<CR>", opts)

keymap.set("n", "<leader>|", ":vsplit<CR>", opts)
keymap.set("n", "<leader>-", ":split<CR>", opts)

keymap.set("n", "<leader>rn", ":IncRename ")
