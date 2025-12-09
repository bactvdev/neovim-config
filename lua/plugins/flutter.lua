return function(use)
	-- Flutter Tools plugin
	use({
		"akinsho/flutter-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for better UI
		},
		config = function()
			require("flutter-tools").setup({
				ui = {
					border = "rounded",
					notification_style = "native",
				},
				decorations = {
					statusline = {
						app_version = true,
						device = true,
						project_config = true,
					},
				},
				debugger = {
					enabled = true,
					run_via_dap = false, -- use true if you have nvim-dap configured
					exception_breakpoints = {},
					register_configurations = function(_)
						-- If using nvim-dap, configure DAP here
					end,
				},
				flutter_path = nil, -- auto-detect from PATH
				flutter_lookup_cmd = nil, -- example: "asdf where flutter"
				fvm = false, -- set to true if using FVM
				widget_guides = {
					enabled = true,
				},
				closing_tags = {
					highlight = "Comment",
					prefix = "// ",
					enabled = true,
				},
				dev_log = {
					enabled = true,
					notify_errors = true,
					open_cmd = "tabedit",
				},
				dev_tools = {
					autostart = false,
					auto_open_browser = false,
				},
				outline = {
					open_cmd = "30vnew",
					auto_open = false,
				},
				lsp = {
					color = {
						enabled = true,
						background = false,
						background_color = nil,
						foreground = false,
						virtual_text = true,
						virtual_text_str = "■",
					},
					on_attach = function(client, bufnr)
						-- Custom on_attach logic here if needed
					end,
					capabilities = function(config)
						local capabilities = require("cmp_nvim_lsp").default_capabilities()
						config.capabilities = vim.tbl_deep_extend("force", config.capabilities or {}, capabilities)
						return config
					end,
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
						renameFilesWithClasses = "prompt",
						enableSnippets = true,
						updateImportsOnRename = true,
					},
				},
			})

			-- Flutter keybindings
			vim.keymap.set("n", "<leader>fr", ":FlutterRun<CR>", { desc = "Flutter Run", silent = true })
			vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>", { desc = "Flutter Quit", silent = true })
			vim.keymap.set("n", "<leader>fR", ":FlutterReload<CR>", { desc = "Flutter Hot Reload", silent = true })
			vim.keymap.set("n", "<leader>fs", ":FlutterRestart<CR>", { desc = "Flutter Hot Restart", silent = true })
			vim.keymap.set("n", "<leader>fD", ":FlutterDevices<CR>", { desc = "Flutter Devices", silent = true })
			vim.keymap.set("n", "<leader>fe", ":FlutterEmulators<CR>", { desc = "Flutter Emulators", silent = true })
			vim.keymap.set("n", "<leader>fo", ":FlutterOutlineToggle<CR>", { desc = "Flutter Outline", silent = true })
			vim.keymap.set("n", "<leader>ft", ":FlutterDevTools<CR>", { desc = "Flutter DevTools", silent = true })
			vim.keymap.set(
				"n",
				"<leader>fc",
				":FlutterCopyProfilerUrl<CR>",
				{ desc = "Copy Profiler URL", silent = true }
			)
			vim.keymap.set("n", "<leader>fl", ":FlutterLspRestart<CR>", { desc = "Flutter LSP Restart", silent = true })
			vim.keymap.set(
				"n",
				"<leader>fv",
				":FlutterVisualDebug<CR>",
				{ desc = "Flutter Visual Debug", silent = true }
			)
		end,
	})
end
