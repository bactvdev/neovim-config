return function(use)
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				scope = { enabled = false },
			})
		end,
	})
	use({
		"Exafunction/windsurf.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	})
end
