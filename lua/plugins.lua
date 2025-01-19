vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	require("plugins.neo-tree")(use)
	require("plugins.colorscheme")(use)
	require("plugins.toggleterm")(use)
	require("plugins.nvim-treesitter")(use)
	require("plugins.bufferline")(use)
	require("plugins.fzf-lua")(use)
	require("plugins.nvim-cmp")(use)
	require("plugins.mason-lsp")(use)
	require("plugins.conform")(use)
	require("plugins.nvim-autopairs")(use)
	require("plugins.gitsigns")(use)
	require("plugins.folke")(use)
	require("plugins.lualine")(use)
	require("plugins.coding")(use)
	require("plugins.ui")(use)
end)
