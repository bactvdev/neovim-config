return function(use)
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "solarized_dark",
				},
				sections = {
					lualine_c = { { "filename", path = 1 } },
				},
			})
		end,
	})
end
