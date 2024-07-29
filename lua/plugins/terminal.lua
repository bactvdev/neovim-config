return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
    })

    local opts = {
      noremap = true,
      silent = true,
    }

    vim.keymap.set('n', '<leader>1', ':1ToggleTerm<CR>', opts)
    vim.keymap.set('n', '<leader>2', ':2ToggleTerm<CR>', opts)
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", opts)
  end
}
