-- vim.cmd.colorscheme("github_dark_dimmed")
-- vim.cmd.colorscheme("catppuccin")
vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("solarized-osaka")
vim.opt.number = true
vim.opt.termguicolors = true
-- Set tab width to 2 spaces
vim.o.tabstop = 2 -- Number of spaces a tab character represents
vim.o.shiftwidth = 2 -- Number of spaces to use for indentation
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.softtabstop = 2 -- How many spaces a Tab feels like when editing

vim.opt.clipboard = "unnamedplus"

vim.g["airline_theme"] = "bubblegum" -- Set a theme (requires vim-airline-themes)
