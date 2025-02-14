return function(use)
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
		config = function()
			require("neo-tree").setup({
				enable_git_status = true,
				enable_diagnostics = true,
				default_component_configs = {
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "󰜌",
					},
				},
				window = {
					mappings = {
						["O"] = function(state)
							local node = state.tree:get_node()
							local path = node:get_id()
							local open_cmd

							if vim.fn.has("win32") == 1 then
								open_cmd = "explorer"
							elseif vim.fn.has("mac") == 1 then
								open_cmd = "open"
							else
								open_cmd = "xdg-open"
							end

							-- Nếu là file, mở thư mục chứa file
							if vim.fn.isdirectory(path) == 0 then
								path = vim.fn.fnamemodify(path, ":h")
							end

							vim.fn.jobstart({ open_cmd, path }, { detach = true })
						end,
					},
				},
			})
		end,
	})
end
