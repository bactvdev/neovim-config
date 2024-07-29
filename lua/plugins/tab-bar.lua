return {
  "romgrk/barbar.nvim",
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  config = function()
    local opts = {
      noremap = true,
      silent = true,
    }
    -- Move to previous/next
    vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
    vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

    -- Re-order to previous/next
    vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
    vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

    -- Pin/unpin buffer
    vim.keymap.set('n', '<A-p>', '<Cmd>Bufferpin<CR>', opts)

    -- Close buffer
    vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
  end
}
