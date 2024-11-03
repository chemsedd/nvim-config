local options = {

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
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
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        -- python
        python = { "ruff_format" },
        -- php = { "intelephense" },
        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        graphql = { "prettier" },
        handlebars = { "prettier" },
    },
    formatters = {
        python = { "ruff_format" },
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
                "-t",
                -- "2",
                -- "--tab 2",
                "$FILENAME",
            },
        },
        ["html-lsp"] = {
            command = "html-lsp",
        },
    },
    notify_on_error = true,
}

return options
