return function(use)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"javascript",
					"html",
					"css",
					"go",
					"typescript",
					"vue",
					"bash",
					"dockerfile",
					"gitignore",
					"json",
					"php",
					"yaml",
					"python",
					"dart",
				},
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				highlight = {
					enable = true,
				},
				indent = { enable = true },
			})
		end,
	})
end
