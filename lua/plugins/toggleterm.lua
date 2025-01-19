return function(use)
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require('toggleterm').setup({
	open_mapping = [[<c-\>]],
	direction = 'horizontal'
      })
    end
  }
end
