return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "lua", "javascript", "java" },
      highlight = { enable = true },
      indent = { enable = true },
    })

    local opts = {
      noremap = true,
      silent = true,
    }
    vim.keymap.set('n', '<leader>e', ':Neotree toggle left<CR>', opts)
    vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
    vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)
    vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
    vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
  end
}
