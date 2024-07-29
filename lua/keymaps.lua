local opts = {
  noremap = true,
  silent = true,
}

local keymap = vim.keymap

-- Common key
keymap.set('n', '<C-a>', 'gg<S-v>G', opts)
keymap.set('n', '<C-s>', ':w<CR>', opts)
keymap.set('i', '<C-s>', '<ESC>:w<CR>', opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Quit
keymap.set("n", "<leader>q", "<cmd>confirm q<CR>", opts)

-- Wrap/Unwrap
keymap.set("n", "<leader>w", "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

-- Tabs

-- Move to previous/next
keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Pin/unpin buffer
keymap.set('n', '<A-p>', '<Cmd>Bufferpin<CR>', opts)

-- Close buffer
keymap.set('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)
keymap.set('n', '<C-x>', '<Cmd>BufferCloseAllButCurrent<CR>', opts)

-- Lazy
keymap.set('n', 'L', '<cmd>Lazy<CR>', opts)

keymap.set('n', '<leader>cf', vim.lsp.buf.format, opts)
