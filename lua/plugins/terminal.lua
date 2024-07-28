return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
    })

    vim.keymap.set('n', '<leader>1', ':1ToggleTerm<CR>')
    vim.keymap.set('n', '<leader>2', ':2ToggleTerm<CR>')
  end
}
