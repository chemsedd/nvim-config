return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
        suggestion = {
            -- enabled = not vim.g.ai_cmp,
            enabled = true,
            auto_trigger = true,
            hide_during_completion = vim.g.ai_cmp,
            keymap = {
                accept = "<A-=>",
                next = "<A-0>",
                prev = "<A-)>",
                dismiss = "<A-/>",
            },
        },
        panel = { enabled = true },
        filetypes = {
            markdown = true,
            help = true,
        },
    },
}
