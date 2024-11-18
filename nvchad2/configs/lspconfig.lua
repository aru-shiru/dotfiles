-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {"html", "cssls"}

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities
    }
end

-- typescript
lspconfig.tsserver.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities
}

-- php
lspconfig.intelephense.setup {
    commands = {
        IntelephenseIndex = {function()
            vim.lsp.buf.execute_command({
                command = 'intelephense.index.workspace'
            })
        end}
    },
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
    end,
    capabilities = capabilities
}

-- Vue, JavaScript, TypeScript
lspconfig.volar.setup {
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
    end,
    capabilities = capabilities,
    -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
    -- This drastically improves the responsiveness of diagnostic updates on change
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'}
}

-- Deno
lspconfig.denols.setup {
    capabilities = capabilities
}

-- Tailwind CSS
lspconfig.tailwindcss.setup {
    capabilities = capabilities
}

-- JSON
lspconfig.jsonls.setup {
    capabilities = capabilities,
    settings = {
        json = {
            schemas = require('schemastore').json.schemas()
        }
    }
}

-- GOLANG
lspconfig.gopls.setup {
    capabilities = capabilities
}
