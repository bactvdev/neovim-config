-- vim.cmd.colorscheme("github_dark_dimmed")
-- vim.cmd.colorscheme("catppuccin")
vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("solarized-osaka")
vim.opt.number = true
vim.opt.termguicolors = true
-- Set tab width to 2 spaces
vim.o.tabstop = 4 -- Number of spaces a tab character represents
vim.o.shiftwidth = 4 -- Number of spaces to use for indentation
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.softtabstop = 4 -- How many spaces a Tab feels like when editing

vim.opt.clipboard = "unnamedplus"

vim.g["airline_theme"] = "bubblegum" -- Set a theme (requires vim-airline-themes)

vim.api.nvim_create_user_command("NeogenAllMethods", function()
	-- Require necessary modules
	local ts_utils = require("nvim-treesitter.ts_utils")
	local neogen = require("neogen")

	-- Ensure parser exists and buffer is TypeScript
	local parser = vim.treesitter.get_parser(0, "typescript")
	if not parser then
		vim.notify("No TypeScript parser available", vim.log.levels.ERROR)
		return
	end

	-- Parse the tree and get root
	local tree = parser:parse()[1]
	if not tree then
		vim.notify("Failed to parse TypeScript tree", vim.log.levels.ERROR)
		return
	end

	-- Get current cursor position to restore later
	local original_pos = vim.api.nvim_win_get_cursor(0)

	-- Iterate through method definitions
	local function process_node(node)
		if node:type() == "method_definition" then
			local row, col = node:start()
			-- Move cursor to start of method (adding 1 since Lua is 1-based)
			vim.api.nvim_win_set_cursor(0, { row + 1, col })
			-- Generate documentation
			neogen.generate({ type = "func" })
		end

		-- Recursively process child nodes
		for child in node:iter_children() do
			process_node(child)
		end
	end

	-- Process all nodes
	process_node(tree:root())

	-- Restore original cursor position
	vim.api.nvim_win_set_cursor(0, original_pos)
end, {
	desc = "Generate Neogen documentation for all TypeScript methods",
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
