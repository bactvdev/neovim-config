return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
      open_mapping = [[<leader>h]],
    })

    -- local Terminal = require("toggleterm.terminal").Terminal
    -- local terminal1 = Terminal:new({ cmd = "bash", hidden = true, direction = "horizontal" })
    -- local terminal2 = Terminal:new({ cmd = "bash", hidden = true, direction = "vertical" })
    -- local terminal3 = Terminal:new({ cmd = "bash", hidden = true, direction = "float" })
    --
    -- vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua terminal1:toggle()<CR>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>lua terminal2:toggle()<CR>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua terminal3:toggle()<CR>", { noremap = true, silent = true })
  end,
}
