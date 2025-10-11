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
                "<leader>ca",
                function() require("actions-preview").code_actions() end,
                mode = { "n", "v" },
                desc = "Code actions"
            }
        }
    },
    {
      "dnlhc/glance.nvim",
      keys = {
        { "gd", "<cmd>Glance definitions<cr>", desc = "Definitions" },
        { "gt", "<cmd>Glance type_definitions<cr>", desc = "Types" },
        { "gr", "<cmd>Glance references<cr>", desc = "References" },
        { "gi", "<cmd>Glance implementations<cr>", desc = "Implementations" },
      }
    }
}

