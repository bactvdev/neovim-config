return function(use)
	use({
		"williamboman/mason-lspconfig.nvim",
		requires = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup({
				ensure_installed = { "stylua", "prettierd", "prettier", "php_cs_fixer", "eslint_d", "goimports" },
				automatic_installation = true,
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"cssls",
					"ts_ls",
					"intelephense",
					"html",
					"volar",
					"gopls",
					"solc",
					"solidity",
					"jsonls",
					"tailwindcss",
				},
				automatic_installation = true,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local lsp_servers = {
				gopls = {},
				lua_ls = {},
				cssls = {},
				tailwindcss = {},
				jsonls = {
					settings = {
						json = {
							schemas = {
								{
									description = "NPM package.json file",
									fileMatch = { "package.json" },
									url = "https://json.schemastore.org/package.json",
								},
							},
							validate = { enable = true },
						},
					},
				},
				ts_ls = {
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = "/home/bactv/.nvm/versions/node/v20.15.0/lib/node_modules/@vue/typescript-plugin",
								languages = {
									"javascript",
									"javascriptreact",
									"javascript.jsx",
									"typescript",
									"typescriptreact",
									"typescript.tsx",
									"vue",
								},
							},
						},
					},
					filetypes = {
						"javascript",
						"typescript",
						"vue",
					},
				},
				intelephense = {},
				html = {},
				volar = {
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				},
			}

			for server, opts in pairs(lsp_servers) do
				lspconfig[server].setup(vim.tbl_deep_extend("force", {
					capabilities = capabilities,
				}, opts))
			end
		end,
	})
end
