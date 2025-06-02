require "nvchad.options"

local o = vim.o
local api = vim.api

-- folding options
o.foldcolumn = "0" -- '0' is not bad
o.foldlevel = 199 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

-- editor
o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.relativenumber = false -- Shows relative line numbers for other lines
vim.opt.clipboard:append "unnamedplus" -- Add unnamedplus to clipboard options

-- navic breadcrumb config
o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
api.nvim_set_hl(0, "NavicIconsFile", { default = true, bg = "#1e1e1e", fg = "#f0f0f0" })
api.nvim_set_hl(0, "NavicIconsModule", { default = true, bg = "#1e1e1e", fg = "#dcdcaa" })
api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, bg = "#1e1e1e", fg = "#79b4a9" })
api.nvim_set_hl(0, "NavicIconsPackage", { default = true, bg = "#1e1e1e", fg = "#c5a5c5" })
api.nvim_set_hl(0, "NavicIconsClass", { default = true, bg = "#1e1e1e", fg = "#e78a4e" })
api.nvim_set_hl(0, "NavicIconsMethod", { default = true, bg = "#1e1e1e", fg = "#82aaff" })
api.nvim_set_hl(0, "NavicIconsProperty", { default = true, bg = "#1e1e1e", fg = "#f9c74f" })
api.nvim_set_hl(0, "NavicIconsField", { default = true, bg = "#1e1e1e", fg = "#f9b4a1" })
api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, bg = "#1e1e1e", fg = "#89d2be" })
api.nvim_set_hl(0, "NavicIconsEnum", { default = true, bg = "#1e1e1e", fg = "#f4a261" })
api.nvim_set_hl(0, "NavicIconsInterface", { default = true, bg = "#1e1e1e", fg = "#f1fa8c" })
api.nvim_set_hl(0, "NavicIconsFunction", { default = true, bg = "#1e1e1e", fg = "#8ac926" })
api.nvim_set_hl(0, "NavicIconsVariable", { default = true, bg = "#1e1e1e", fg = "#56b6c2" })
api.nvim_set_hl(0, "NavicIconsConstant", { default = true, bg = "#1e1e1e", fg = "#d19a66" })
api.nvim_set_hl(0, "NavicIconsString", { default = true, bg = "#1e1e1e", fg = "#f39c12" })
api.nvim_set_hl(0, "NavicIconsNumber", { default = true, bg = "#1e1e1e", fg = "#e74c3c" })
api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, bg = "#1e1e1e", fg = "#2ecc71" })
api.nvim_set_hl(0, "NavicIconsArray", { default = true, bg = "#1e1e1e", fg = "#9b59b6" })
api.nvim_set_hl(0, "NavicIconsObject", { default = true, bg = "#1e1e1e", fg = "#f39c12" })
api.nvim_set_hl(0, "NavicIconsKey", { default = true, bg = "#1e1e1e", fg = "#d63031" })
api.nvim_set_hl(0, "NavicIconsNull", { default = true, bg = "#1e1e1e", fg = "#95a5a6" })
api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, bg = "#1e1e1e", fg = "#e67e22" })
api.nvim_set_hl(0, "NavicIconsStruct", { default = true, bg = "#1e1e1e", fg = "#e74c3c" })
api.nvim_set_hl(0, "NavicIconsEvent", { default = true, bg = "#1e1e1e", fg = "#1abc9c" })
api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "#1e1e1e", fg = "#f1c40f" })
api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, bg = "#1e1e1e", fg = "#8e44ad" })
api.nvim_set_hl(0, "NavicText", { default = true, bg = "#1e1e1e", fg = "#ffffff" })
api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "#1e1e1e", fg = "#bdc3c7" })

-- Show dashboard when all buffers are closed
api.nvim_create_autocmd("BufDelete", {
    callback = function()
        local bufs = vim.t.bufs
        if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
            vim.cmd "Dashboard"
        end
    end,
})
