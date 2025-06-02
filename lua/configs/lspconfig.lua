-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "json" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

-- Python config
local formatter = nil

if require("conform").get_formatter_info("ruff").available then
    formatter = "ruff"
elseif require("conform").get_formatter_info("black").available then
    formatter = "black"
else
    formatter = "autopep8"
end

local on_attach = function(client, bufnr)
    if client.name == formatter then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
    end
end

lspconfig[formatter].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
}

lspconfig.pyright.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { "*" },
            },
        },
    },
}

-- Code breadcrumb
local navic = require "nvim-navic"

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end,
}
