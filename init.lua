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

require("ufo").setup {
    provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
    end,
}

vim.schedule(function()
    require "mappings"
end)

require("notify").setup {
    background_colour = "#000000",
}

-- extend snippets mappings
local luasnip = require "luasnip"
luasnip.filetype_extend("htmldjango", { "html", "css", "tailwindcss" })
luasnip.filetype_extend("scss", { "css", "tailwindcss" })

require("lspconfig").jsonls.setup {
    filetypes = { "json", "jsonl" },
    init_options = {
        provideFormatter = true,
    },
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
            end,
        },
    },
}
