return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        -- A list of languages to install.
        ensure_installed = {"php", "javascript", "html", "css", "go", "lua", "vim" },
        -- A table that enables different functionalities.
        sync_install = false, -- Whether to install parsers synchronously (recommended for small sets).
        auto_install = true,  -- Whether to automatically install parsers for new languages.
        highlight = {
            enable = true,
            -- Disable highlight for certain languages
            -- disable = { "c", "rust" },
        },
        indent = { enable = true, },
    }
}
