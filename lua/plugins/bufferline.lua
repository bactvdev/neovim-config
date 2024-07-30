return {
  "akinsho/bufferline.nvim",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  event = "VeryLazy",
  opts = {
    options = {
      mode = "tabs",
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  },
  config = function()
    require('bufferline').setup {}

    function CloseBufferAndSwitch()
      local bufnr = vim.fn.bufnr('%')
      vim.cmd('BufferLineCyclePrev')
      vim.cmd('bdelete! ' .. bufnr)
    end

    vim.keymap.set('n', '<C-c>', ':lua CloseBufferAndSwitch()<CR>', { noremap = true, silent = true })
  end
}
