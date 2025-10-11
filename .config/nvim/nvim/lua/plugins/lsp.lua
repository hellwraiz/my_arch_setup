return {

    { "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config['lua_ls'] = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        }
                    }
                },
                on_attach = function(client, bufnr)
                    -- Disable semantic tokens from lua_ls
                    client.server_capabilities.semanticTokensProvider = nil
                end,
            }
        end,
    },
    { "mason-org/mason.nvim", opts = {} },
    { "mason-org/mason-lspconfig.nvim",
        opts = { ensure_installed = { "lua_ls", "gopls" } },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }
}

