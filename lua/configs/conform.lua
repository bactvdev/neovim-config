local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    vue = { "prettier" },
    jsx = { "prettier" },
    tsx = { "prettier" },
    go = { "goimports" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return options
