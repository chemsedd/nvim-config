local options = {

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 7000,
        lsp_fallback = true,
        async = false,
    },

    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        less = { "prettier" },
        -- json = { "json-lsp" },
        -- jsonc = { "prettier" },
        python = { "ruff", "ruff_format" },
        -- python = { "black", "isort" },
        php = { "intelephense" },
        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        graphql = { "prettier" },
        handlebars = { "prettier" },
    },
    formatters = {
        intelephense = {},
        ["php-cs-fixer"] = {
            command = "php-cs-fixer",
            prepend_args = {
                "--no-interaction",
                "--quiet",
                "--config=.php-cs-fixer.dist.php",
                "fix",
                "$FILENAME",
            },
            stdin = false,
        },
        ["pretty-php"] = {
            args = {
                -- "-t",
                -- "4",
                -- "--tab 4",
                "$FILENAME",
            },
        },
        ["html-lsp"] = {
            command = "html-lsp",
        },

        ["black"] = {
            command = "black",
            args = {
                "-l",
                "100",
                "-",
            },
        },
    },
    notify_on_error = true,
}

return options
