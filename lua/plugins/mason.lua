local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.execs = {
  "lua_ls",
  "gopls",
  "tsserver",
  "volar",
  "html",
  "cssls",
  "tailwindcss",
  "jdtls",
  "clangd"
}

function M.config()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })

  local masonconfig = require("mason-lspconfig")
  masonconfig.setup({
    ensure_installed = M.execs,
  })

  local lspconfig = require("lspconfig")
  masonconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({})
    end,
  })

  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.eslint,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.code_actions.eslint,
    },
  })
end

return M
