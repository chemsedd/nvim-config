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
                "stylua", -- lua formatter
                "isort", -- python formatter
                "autopep8", -- python formatter
                "pylint", -- python linter
                "flake8", -- python linter
                "eslint_d", -- js linter
                "pyright",
            },
        }
    end,
}
