return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",

        -- Hide built-in vim stuff. For now commented out because I want to give it a try
        --[[ plugins = {
            marks = false,       -- shows a list of your marks on ' and `
            registers = false,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = false,  -- z= for spelling suggestions
            },
            presets = {
                operators = false,    -- d, y, c, etc.
                motions = false,      -- w, e, b, etc.
                text_objects = false, -- iw, aw, etc.
                windows = false,      -- <C-w> commands
                nav = false,          -- Navigation commands
                z = false,            -- z commands
                g = false,            -- g commands
            },
        }, ]]
        spec = {
            -- Basic shortcuts ---------------------------------------------------------------------------



            { '<Esc>' , '<cmd>nohlsearch<CR>', desc = 'Get rid of highlight from searching' },
            { '<C-E>', '<Esc>', desc='A way to press escape without getting out insert mode', mode = 'i' },
            { '<F5>', ':!xdg-open %<CR>', desc='Open the current buffer in the file exprorer'},
            { '+', '<C-w>+', desc = 'allows for much smoother window growing'},
            { '-', '<C-w>-', desc = 'allows for much smoother window shrinking'},

            -- Window switcher
            { '<A-h>', ':TmuxNavigateLeft<CR>', desc = 'Move one window left' },
            { '<A-l>', ':TmuxNavigateRight<CR>', desc = 'Move one window right' },
            { '<A-j>', ':TmuxNavigateDown<CR>', desc = 'Move one window down' },
            { '<A-k>', ':TmuxNavigateUp<CR>', desc = 'Move one window up' },

            -- Buffer thingies
            { '<leader>b', group = 'All things buffer' },
            { '<leader>bn', ':bn<CR>', desc = 'Next buffer' },
            { '<leader>bp', ':bp<CR>', desc = 'Previous buffer' },
            { '<leader>bx', ':bd<CR>', desc = 'Close current buffer' },
            { '<leader>bd', ':BufferLinePickClose<CR>', desc = 'Close some buffer' },
            { '<leader>bcc', ':BufferLineCloseOthers<CR>', desc = 'Close other buffers' },
            { '<leader>bcl', ':BufferLineCloseLeft<CR>', desc = 'Close left buffers of current one' },
            { '<leader>bcr', ':BufferLineCloseRight<CR>', desc = 'Close right buffers of current one' },

            -- save 'n quit
            { '<leader>q', ':qa!<CR>', desc = 'Quit without saving' },
            { '<leader>w', ':w<CR>', desc = 'Save current buffer' },
            { '<leader>W', ':wqa<CR>', desc = 'Save \'n quit' },
            { '<leader>x', ':close<CR>', desc = 'close current buffer' },

            -- LSP shortcuts -----------------------------------------------------------------------------

            { '<leader>l', group = 'lsp shortcuts' },
            -- There are alse '<leader>lg*' versions defined in glance.nvim
            { '<leader>lr', vim.lsp.buf.references, desc = 'get lsp reference' },
            { '<leader>ld', vim.lsp.buf.definition, desc = 'get lsp definition' },
            { '<leader>lt', vim.lsp.buf.type_definition, desc = 'get type definition' },
            { '<leader>li', vim.lsp.buf.implementation, desc = 'get lsp implementation' },
            { '<leader>ls', vim.lsp.buf.document_symbol, desc = 'see document funcs and vars' },
            { '<leader>lS', vim.lsp.buf.workspace_symbol, desc = 'see workspace funcs and vars' },
            { '<leader>lc', vim.lsp.buf.incoming_calls, desc = 'get incoming calls (places this func is called)' },
            { '<leader>lo', vim.lsp.buf.outgoing_calls, desc = 'get outgoing calls (funcs that this func calls)' },
            { '<leader>lR', vim.lsp.buf.rename, desc = 'lsp smart rename' },
            { '<leader>lk', vim.lsp.buf.hover, desc = 'hover documentation' },
            { '<leader>lK', vim.lsp.buf.signature_help, desc = 'different hover documentation' },

            -- Diagnostic
            -- `]d` jumps to the next diagnostic in the buffer. ]d-default
            -- `[d` jumps to the previous diagnostic in the buffer. [d-default
            -- `]D` jumps to the last diagnostic in the buffer. ]D-default
            -- `[D` jumps to the first diagnostic in the buffer. [D-default
            -- `<C-w>d` shows diagnostic at cursor in a floating window. CTRL-W_d-default

            -- Plugin setups
            { '<leader>h', group = 'Git hunk operations'},
            { '<leader>t', group = 'Toggle git stuff'},
            { '<leader>f', group = 'Telescope shortcuts'},
            { '<leader>n', group = 'NvimTree shortcuts'},
        }
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
