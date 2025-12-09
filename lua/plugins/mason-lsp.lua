return function(use)
	use({
		"williamboman/mason-lspconfig.nvim",
		requires = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup({
				ensure_installed = {
					"stylua",
					"prettierd",
					"prettier",
					"php_cs_fixer",
					"eslint_d",
					"goimports",
					"pyright",
				},
				automatic_installation = true,
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"cssls",
					"ts_ls",
					"intelephense",
					"html",
					"gopls",
					"solc",
					"jsonls",
					"tailwindcss",
				},
				automatic_installation = true,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Define LSP server configurations using vim.lsp.config
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
				pyright = {},
			}

			-- Configure each LSP server using the new vim.lsp.config API
			for server, opts in pairs(lsp_servers) do
				vim.lsp.config[server] = vim.tbl_deep_extend("force", {
					capabilities = capabilities,
				}, opts)
			end

			-- Auto-enable LSP servers based on filetype
			local filetypes_to_servers = {
				go = { "gopls" },
				lua = { "lua_ls" },
				css = { "cssls", "tailwindcss" },
				scss = { "cssls" },
				json = { "jsonls" },
				javascript = { "ts_ls" },
				typescript = { "ts_ls" },
				javascriptreact = { "ts_ls" },
				typescriptreact = { "ts_ls" },
				vue = { "ts_ls", "volar" },
				php = { "intelephense" },
				html = { "html", "tailwindcss" },
				python = { "pyright" },
			}

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local servers = filetypes_to_servers[args.match]
					if servers then
						for _, server in ipairs(servers) do
							vim.lsp.enable(server)
						end
					end
				end,
			})
		end,
	})
end
