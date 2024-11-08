vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.opt.scrolloff = 0
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 199 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Spectre config
vim.keymap.set("n", "<leader>Rr", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set("n", "<leader>Rc", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search and replace current word",
})
vim.keymap.set("v", "<leader>Rs", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search and replace current selection",
})
vim.keymap.set("n", "<leader>Rf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file",
})

require("ufo").setup {
    provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
    end,
}

vim.schedule(function()
    require "mappings"
end)
