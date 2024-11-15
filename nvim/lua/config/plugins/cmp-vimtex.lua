return {
    "micangl/cmp-vimtex",
    config = function ()
        local cmp = require('cmp')
        cmp.setup {
            -- global configuration goes here
            sources = {
              { name = 'buffer' },
              -- other sources (GLOBAL)
            },
        }
        cmp.setup.filetype("tex", {
            sources = {
              { name = 'vimtex' },
              { name = 'buffer' },
              -- other sources
            },
        })
    end
}
