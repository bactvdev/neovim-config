return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- config = function()
    --   require("mason-lspconfig").setup({
    --     ensure_installed = { "lua_ls", "gopls" }
    --   })
    -- end
    lazy = false,
    opts = {
      auto_install = true,
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities
      })

      lspconfig.html.setup({
        capabilities = capabilities
      })

      local opts = {
        noremap = true,
        silent = true,
      }
      -- Mappings.
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    end
  },
}
