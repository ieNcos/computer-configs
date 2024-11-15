vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "no"
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.smarttab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.conceallevel = 2
vim.o.history = 1000

vim.g.python_host_prog="/usr/bin/ipython"

vim.cmd([[
au InsertLeave *.tex write
]])
vim.cmd([[
set termencoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
]])
vim.cmd([[
highlight Normal guibg=NONE ctermbg=NONE
]])

vim.api.nvim_create_autocmd( 'FileType', { pattern = {"clojure", "python", "rust", "c", "lua", "cpp", "fish", "markdown", "haskell", "latex"},
    callback = function ()
        vim.treesitter.start()
    end
})
vim.api.nvim_create_autocmd( 'FileType', { pattern = "lua",
    callback = function ()
        vim.cmd([[
        syntax match index "wordTrig = " conceal
        syntax match index "snippetType = " conceal
        syntax match index "trigEngine = " conceal
        syntax match index "trig = " conceal
        syntax match index "dscr = " conceal
        ]])
    end
})

vim.api.nvim_create_autocmd( 'FileType', { pattern = {"tex", "latex"},
    callback = function ()
        vim.cmd([[
        syntax match index "oldsymbol" conceal
        ]])
    end
}) --没有用，对数学环境里的东西没有用，对数学环境外的才有效。
