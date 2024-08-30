require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-s>", "<ESC>:w<CR>", { desc = "General Save file" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
map("n", "<C-b>", "va{", { desc = "Select a block { }" })
map(
  "n",
  "<C-Right>",
  "<cmd>vertical resize +5<CR>",
  { desc = "Increase the window width", noremap = true, silent = true }
)
map(
  "n",
  "<C-Left>",
  "<cmd>vertical resize -5<CR>",
  { desc = "Decrease the window width", noremap = true, silent = true }
)

map(
  "n",
  "<C-Up>",
  "<cmd>horizontal resize +2<CR>",
  { desc = "Increase the window height", noremap = true, silent = true }
)
map(
  "n",
  "<C-Down>",
  "<cmd>horizontal resize -2<CR>",
  { desc = "Decrease the window height", noremap = true, silent = true }
)
-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- tabufline
map("n", "<C-n>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<C-A-n>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<C-c>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- telescope
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })

map("n", "<C-f>", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })

map("n", "<leader>g", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float" }
  lazygit:toggle()
end, { desc = "Lazy Git" })
