require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
-- folding options
o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 199 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
-- editor
vim.opt.relativenumber = true -- Shows relative line numbers for other lines
vim.opt.clipboard:append "unnamedplus" -- Add unnamedplus to clipboard options
