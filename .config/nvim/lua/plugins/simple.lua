return {

    -- used to be able to use icons everywhere.
    "nvim-tree/nvim-web-devicons",

    -- tmux
    "christoomey/vim-tmux-navigator",

    -- custom status line and buffer/tab line
    { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons", opts = {options = { theme = 'gruvbox'}} },
    { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", opts = { options = { diagnostics = "nvim_lsp" } } },


    -- quality of life
    { "junegunn/vim-easy-align", keys= {{"ga", ":EasyAlign<cr>", mode = { "n", "x" }, desc="just an easier way to align things"}}},
    "tpope/vim-surround",
    { 'numToStr/Comment.nvim', opts = {} },
    { 'windwp/nvim-autopairs', event = "InsertEnter", opts = { check_ts = true } },
    "mg979/vim-visual-multi",
    { "windwp/nvim-ts-autotag", opts = {} },

    -- colourscheme stuff
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {} },
    { "navarasu/onedark.nvim", priority = 1000,
        config = function()
            require('onedark').setup {
                style = 'darker'
            }
            -- Enable theme
            -- require('onedark').load()
        end
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = { transparent_mode = true }},

    --git stuff
    "tpope/vim-fugitive",
}
