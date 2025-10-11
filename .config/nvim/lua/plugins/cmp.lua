---@diagnostic disable: undefined-doc-name
return {
    {'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = 'default',
            ['<M-b>'] = { 'select_next', 'fallback' },
            ['<M-f>'] = { 'select_prev', 'fallback' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-Space>'] = { 'show', 'fallback' },
            ['<M-e>'] = { 'hide', 'fallback' },
            ['<Tab>'] = { 'accept', 'fallback' },
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        -- (NOT-Default) By default they only show things when toggled??

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                window = {
                    border = 'rounded',
                }
            },
            menu = {
                border = 'rounded',
            }
        },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },
        snippets = {
            expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
            active = function(filter)
                if filter and filter.direction then
                    return require('luasnip').jumpable(filter.direction)
                end
                return require('luasnip').in_snippet()
            end,
            jump = function(direction) require('luasnip').jump(direction) end,
        },
    },
    opts_extend = { "sources.default" }
},
{
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        local luasnip = require("luasnip")

        -- Load friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Snippet jump keybindings
        vim.keymap.set({"i", "s"}, "<C-l>", function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { desc = "Expand or jump forward in snippet" })

        vim.keymap.set({"i", "s"}, "<C-h>", function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { desc = "Jump backward in snippet" })
    end,
}
}
