return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        branch = '0.1.x',
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope fd<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git files" },
            { "<leader>fd", function()
                local pickers = require('telescope.pickers')
                local finders = require('telescope.finders')
                local previewers = require('telescope.previewers')
                local conf = require('telescope.config').values

                pickers.new({}, {
                    prompt_title = 'Directories',
                    finder = finders.new_oneshot_job({'find', '.', '-type', 'd'}, {}),
                    sorter = conf.generic_sorter({}),
                    previewer = previewers.vim_buffer_cat.new({}),
                }):find()
            end, desc = "Find directories" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { "<leader>ft", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
            { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
            { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },
        },
        config = function()
            local telescope = require('telescope')

            telescope.setup({
                pickers = {
                    fd = {
                        hidden = true
                    }
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    }
                }
            })

            -- Load extensions
            telescope.load_extension("ui-select")
        end
    },
    -- UI-select extension
    {
        'nvim-telescope/telescope-ui-select.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
    }
}
