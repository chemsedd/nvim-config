require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<Leader>qq", ":qa<CR>", { desc = "Exit NeoVim" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
