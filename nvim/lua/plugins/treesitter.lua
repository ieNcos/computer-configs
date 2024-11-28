return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function ()
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup {
            auto_install = true,
            ensure_installed = {
                'python',
                'markdown',
                'lua',
                'vim',
                'latex',
                'fish',
                'bash',
                'scheme',
                'rust',
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}