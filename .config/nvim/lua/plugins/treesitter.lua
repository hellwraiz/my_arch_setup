return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,

    config = function()
        require('nvim-treesitter').setup({
            install_dir = vim.fn.stdpath('data') .. '/site',
        })

        -- Enable highlighting with smart error handling
        vim.api.nvim_create_autocmd('FileType', {
            pattern = '*',
            callback = function()
                local ft = vim.bo.filetype

                local ignore_fts = { 'NvimTree','lazy', 'mason', 'help', 'checkhealth', 'blink-cmp-documentation', 'blink-cmp-menu', 'fugitive' }

                for _, ignore_ft in ipairs(ignore_fts) do
                    if ft == ignore_ft then
                        return
                    end
                end

                -- Try to start treesitter, notify if parser missing
                local ok, err = pcall(vim.treesitter.start)
                if not ok and err:match("Parser could not be created for buffer") then
                    vim.api.nvim_echo({
                        {"Treesitter: ", "Normal"},
                        {string.format("No parser for '%s'", ft), "WarningMsg"}
                    }, false, {})
                elseif not ok then
                    error(err)
                end
            end,
        })

    end
}
