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
                on_attach = function(client, _)
                    -- Disable semantic tokens from lua_ls
                    client.server_capabilities.semanticTokensProvider = nil
                end,
            }
            vim.lsp.config['pylsp'] = {
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                enabled = true,
                                ignore = {'E501', 'E231'},
                                maxLineLength = 120
                            },
                            pyflakes = {
                                enabled = true
                            },
                            pylint = {
                                enabled = false  -- optional, if you don't want pylint
                            },
                        }
                    }
                }

            }
        end,
    },
    { "mason-org/mason.nvim", opts = {} },
    { "mason-org/mason-lspconfig.nvim",
        opts = { ensure_installed = { "bashls", "lua_ls", "gopls", "svelte", "tailwindcss", "ts_ls", "html", "cssls", "eslint", "pylsp" } },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                javascript = { "prettier" },
                svelte = { "prettier" },
                typescript = { "prettier" },
                go = { "goimports" },
            },
            --[[ formatters = {
                prettier = {
                    -- Don't run if config file not found
                    require_cwd = true,
                },
            }, ]]
            format_on_save = {
                timeout_ms = 500,
                fallback_lsp = true,
            },
        },
    }
}

