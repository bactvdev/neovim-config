return {
  "williamboman/mason.nvim",
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "vue-language-server",
      "json-lsp",
      "css-variables-language-server",
    },
  },
}
