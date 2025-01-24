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

if require("conform").get_formatter_info("black").available then
    local black_on_attach = function(client, bufnr)
        if client.name == "blackd-client" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end

    lspconfig.black.setup {
        on_attach = black_on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end
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
