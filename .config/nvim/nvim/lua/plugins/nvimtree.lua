return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>nt", ":NvimTreeToggle<cr>", desc="a nvim tree toggler"},
        { "<leader>no", ":NvimTreeOpen<cr>", desc="a way to open nvim tree"},
        { "<leader>nf", ":NvimTreeFindFile<cr>", desc="used to find current buffer's location in the nvim tree"}},
    config = function()
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true

        -- Some setup here
        require("nvim-tree").setup {
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
                highlight_git = "all",
                icons = {
                    web_devicons = {
                        folder = {
                            enable = true,
                        },
                    },
                },
            },
            filters = {
                dotfiles = false,
            },

        }
    end,
}
