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

if vim.g.neovide then
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    -- vim.g.neovide_floating_blur_amount_x = 8.0
    -- vim.g.neovide_floating_blur_amount_y = 8.0

    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5

    vim.g.neovide_floating_corner_radius = 0.2

    -- vim.g.neovide_opacity = 0.98
    -- vim.g.neovide_normal_opacity = 0.98

    vim.g.experimental_layer_grouping = true
end

-- Restore cursor position on file open
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local line = vim.fn.line "'\""
        if
            line > 1
            and line <= vim.fn.line "$"
            and vim.bo.filetype ~= "commit"
            and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
        then
            vim.cmd 'normal! g`"'
        end
    end,
})
