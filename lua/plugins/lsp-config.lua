return {
	"neovim/nvim-lspconfig",
	config = function()
		local opts = {
			noremap = true,
			silent = true,
		}
		-- Mappings.
		vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
		vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
}
