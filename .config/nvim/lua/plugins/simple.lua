return {

    -- used to be able to use icons everywhere
    "nvim-tree/nvim-web-devicons",

    -- tmux
    "christoomey/vim-tmux-navigator",

    -- custom status line and buffer/tab line
    { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons", opts = {} },
    { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", opts = { options = { diagnostics = "nvim_lsp" } } },
}
