return function(use)
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	})

	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({})
		end,
	})

	use({
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "warm",
				transparent = true,
				toggle_style_key = "<leader>ts",
			})
		end,
	})

	use({
		"craftzdog/solarized-osaka.nvim",
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
			})
		end,
	})
end
