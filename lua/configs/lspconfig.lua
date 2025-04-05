-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

-- ruff config
-- if require("conform").get_formatter_info("ruff_format").available then
--     local ruff_on_attach = function(client, bufnr)
--         if client.name == "ruff" then
--             -- Disable hover in favor of Pyright
--             client.server_capabilities.hoverProvider = false
--         end
--     end
--
--     lspconfig.ruff.setup {
--         on_attach = ruff_on_attach,
--         on_init = nvlsp.on_init,
--         capabilities = nvlsp.capabilities,
--     }

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

-- else
-- pyright config
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
-- end
