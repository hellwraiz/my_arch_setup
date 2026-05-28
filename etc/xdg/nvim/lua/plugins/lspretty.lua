return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require('tiny-inline-diagnostic').setup()
            vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
        end
    },
    {
        "aznhe21/actions-preview.nvim",
        keys = {
            {
                "<leader>la",
                function() require("actions-preview").code_actions() end,
                mode = { "n", "v" },
                desc = "Code actions"
            }
        }
    },
    {
      "dnlhc/glance.nvim",
      keys = {
        { "<leader>lgd", "<cmd>Glance definitions<cr>", desc = "Glance Definitions" },
        { "<leader>lgt", "<cmd>Glance type_definitions<cr>", desc = "Glance Type definitions" },
        { "<leader>lgr", "<cmd>Glance references<cr>", desc = "Glance References" },
        { "<leader>lgi", "<cmd>Glance implementations<cr>", desc = "Glance Implementations" },
      }
    }
}

