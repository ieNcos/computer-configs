return {
	'lervag/vimtex',
    config = function ()
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_view_general_viewer = 'zathura'
        vim.g.vimtex_view_method = 'zathura'
        vim.g.text_conceal = 'abdmg'
        vim.g.tex_fast = 'M'
        vim.cmd([[
syntax enable
syntax cluster texMathZoneGroup add=texBoldStyle
syntax cluster texMathMatchGroup add=texBoldStyle
syntax region texBoldStyle matchgroup=texStatement start='\\vect\s*{' end='}' contains=texMathZoneX contained concealends
syntax region texBoldStyle matchgroup=texStatement start='\\boldsymbol\s*{' end='}' contains=texMathZoneX contained concealends
        ]])
        --vim.g.vimtex_complete_enabled = 1
    end,
}
