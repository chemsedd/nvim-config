return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            ---@diagnostic disable-next-line: different-requires
            require "configs.lspconfig"
        end,
    },

    --
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "OXY2DEV/markview.nvim" },
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "scss",
                "htmldjango",
                "python",
                "ruby",
                "bash",
            },
        },
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        opts = function(_, opts)
            opts.pickers = {
                find_files = {
                    hidden = true,
                    no_ignore = true,
                    file_ignore_patterns = {
                        "node_modules",
                        "%.git/",
                        "%.DS_Store",
                        "dist",
                        "build",
                        "%.pdf",
                        "%.class",
                        "target/",
                        "%.lock",
                        ".venv",
                        "venv",
                    },
                },
            }
            return opts
        end,
    },

    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
}
