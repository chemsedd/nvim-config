return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },

        -- optional picker via telescope
        { "nvim-telescope/telescope.nvim" },
        -- optional picker via fzf-lua
        { "ibhagwan/fzf-lua" },
        -- .. or via snacks
        {
            "folke/snacks.nvim",
            opts = {
                terminal = {},
            },
        },
    },
    event = "LspAttach",
    opts = {
        backend = "delta",
        picker = "snacks",
        backend_opts = {
            delta = {
                -- Header from delta can be quite large.
                -- You can remove them by setting this to the number of lines to remove
                header_lines_to_remove = 4,
            },
        },
        signs = {
            quickfix = { "", { link = "DiagnosticWarning" } },
            others = { "", { link = "DiagnosticWarning" } },
            refactor = { "", { link = "DiagnosticInfo" } },
            ["refactor.move"] = { "󰪹", { link = "DiagnosticInfo" } },
            ["refactor.extract"] = { "", { link = "DiagnosticError" } },
            ["source.organizeImports"] = { "", { link = "DiagnosticWarning" } },
            ["source.fixAll"] = { "󰃢", { link = "DiagnosticError" } },
            ["source"] = { "", { link = "DiagnosticError" } },
            ["rename"] = { "󰑕", { link = "DiagnosticWarning" } },
            ["codeAction"] = { "", { link = "DiagnosticWarning" } },
        },
    },
}
