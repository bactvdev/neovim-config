return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      volar = {
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
      },
      vtsls = {},
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },
        },
      },
      typescript = {},
    },
  },
}
