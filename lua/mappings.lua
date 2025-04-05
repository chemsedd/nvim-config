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

-- move lines up/down
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Spectre
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

map("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, desc = "Rename symbol" })

-- Noice
map("n", "<leader>nd", ":NoiceDismiss<CR>", { noremap = true, silent = true, desc = "Dismiss notifications" })
map("n", "<leader>nh", ":NoiceHistory<CR>", { noremap = true, silent = true, desc = "Notifications history" })

-- Git
map("n", "<leader>gb", ":Gitsigns blame<CR>", { noremap = true, silent = true, desc = "Git blame file" })
map("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true, desc = "Git blame file" })
map("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true, desc = "Git blame file" })

-- Telescope
map(
    "n",
    "<leader>fs",
    ":Telescope lsp_document_symbols<CR>",
    { noremap = true, silent = true, desc = "Git blame file" }
)
map("n", "<leader>ff", function()
    require("telescope.builtin").find_files {
        no_ignore = true,
        hidden = true,
    }
end)

local conform = require "conform"
map({ "n", "v" }, "<leader>fr", function()
    conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    }
end, { desc = "Format file or range (in visual mode)" })

-- tabufline, set Alt+number to switch buffer
for i = 1, 9, 1 do
    map("n", string.format("<A-%s>", i), function()
        vim.api.nvim_set_current_buf(vim.t.bufs[i])
    end, { noremap = true, silent = true })
end
