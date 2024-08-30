return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
  lazy = false,
  run = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.g.mkdp_theme = "dark"
  end,
}
