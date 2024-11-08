require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<Leader>qq", ":qa<CR>", { desc = "Exit NeoVim" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- indent a block of code
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Spectre config
map("n", "<leader>Rr", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
map("n", "<leader>Rc", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search and replace current word",
})
map("v", "<leader>Rs", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search and replace current selection",
})
map("n", "<leader>Rf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file",
})
