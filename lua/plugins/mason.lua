return {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require "mason"

        local mason_tool_installer = require "mason-tool-installer"

        -- enable mason and configure icons
        mason.setup {}

        mason_tool_installer.setup {
            ensure_installed = {
                "prettier", -- prettier formatter

                -- python
                "ruff",
                -- "black",
                -- "isort",
                -- "autopep8",
                -- "pylint",
                -- "flake8",
                "pyright",

                "stylua", -- lua formatter
                "eslint_d", -- js linter
                "cssls",
            },
        }
    end,
}
