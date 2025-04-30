-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "tomorrow_night",
    transparency = false,
    theme_toggle = { "tomorrow_night", "ayu_light" },
    hl_override = {
        ["@comment"] = { italic = true },
        ["@keyword"] = { bold = true },
    },
}

M.ui = {
    statusline = {
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "arrow",
    },

    nvdash = {
        load_on_startup = true,
    },
}

return M
