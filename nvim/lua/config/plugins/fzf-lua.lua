return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("fzf-lua").setup({
            vim.keymap.set("n", "<C-c>", ":FzfLua files cwd=\"\"<left>~/", { noremap = true }),
            vim.keymap.set("n", "<C-x><C-f>", function ()
                require("fzf-lua").files()
            end),
        })
    end
}
