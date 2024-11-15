--keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "


local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local mode_t = { "t" }
local nmappings = {
    { from = "S",          to = ":w<CR>" },
    --	{ from = "Q",             to = ":q<CR>" },
    --	{ from = ";",             to = ":",                                                                   mode = mode_nv },
    { from = "Y",          to = "\"+y",                   mode = mode_v },
    { from = "W",          to = "<Cmd>wq!<CR>",           mode = mode_t },
    --not valid
    { from = "<c-;>",      to = "<esc>",                  mode = mode_i },
    --
    { from = "<esc>",      to = "<c-\\><c-n>",            mode = mode_t },
    { from = "<esc>",      to = ":" },
    { from = "<leader>bi", to = "<Cmd>%!xxd<CR>" },
    { from = "<leader>bb", to = "<Cmd>%!xxd -r<CR>" },
    { from = "tt",         to = "<Cmd>NERDTreeToggle<CR>" },
    --	{ from = "`",             to = "~",                                                                   mode = mode_nv },
    --
    -- Movement
    { from = "l",          to = "gk",                     mode = mode_nv },
    { from = "k",          to = "gj",                     mode = mode_nv },
    { from = "j",          to = "h",                      mode = mode_nv },
    { from = ";",          to = "l",                      mode = mode_nv },
    { from = "L",          to = "5gk",                     mode = mode_nv },
    { from = "K",          to = "5gj",                     mode = mode_nv },
    { from = "H",          to = "K",                      mode = mode_nv },
    { from = "J",          to = "0",                      mode = mode_nv },
    { from = ":",          to = "$",                      mode = mode_nv },
    { from = "gk",         to = "gj",                     mode = mode_nv },
    { from = "gl",         to = "gk",                     mode = mode_nv },
    { from = "<Up>",       to = "<c-o>gk",                mode = mode_i },
    { from = "<Down>",     to = "<c-o>gj",                mode = mode_i },
    { from = "jk",         to = "<Right>",                mode = mode_i },
    --	{ from = "h",             to = "e",                                                                   mode = mode_nv },
    --	{ from = "<C-U>",         to = "5<C-y>",                                                              mode = mode_nv },
    --	{ from = "<C-E>",         to = "5<C-e>",                                                              mode = mode_nv },
    --	{ from = "ci",            to = "cl", },
    --	{ from = "cn",            to = "ch", },
    --	{ from = "ck",            to = "ci", },
    --	{ from = "c,.",           to = "c%", },
    --	{ from = "yh",            to = "ye", },
    --
    -- Actions
    { from = "u",          to = "u" },
    --	{ from = "n",             to = "i",                                                                   mode = mode_nv },
    --	{ from = "N",             to = "I",                                                                   mode = mode_nv },
    -- Problems
    --{ from = "H",             to = "K",                                                                  mode = mode_nv },
    -- Useful actions
    --	{ from = ",.",            to = "%",                                                                   mode = mode_nv },
    --	{ from = "<c-y>",         to = "<ESC>A {}<ESC>i<CR><ESC>ko",                                          mode = mode_i },
    --	{ from = "\\v",           to = "v$h", },
    { from = "<c-a>",      to = "<ESC>A",                 mode = mode_i },
    { from = "cc",      to = "$zfa{" },
    --
    --	-- Window & splits
    { from = "<leader>w",  to = "<C-w>w", },
    { from = "<leader>l",  to = "<C-w>k", },
    { from = "<leader>k",  to = "<C-w>j", },
    { from = "<leader>j",  to = "<C-w>h", },
    { from = "<leader>;",  to = "<C-w>l", },
    --	{ from = "qf",            to = "<C-w>o", },
    --	{ from = "s",             to = "<nop>", },
    --	{ from = "su",            to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", },
    --	{ from = "se",            to = ":set splitbelow<CR>:split<CR>", },
    --	{ from = "sn",            to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", },
    --	{ from = "si",            to = ":set splitright<CR>:vsplit<CR>", },
    --	{ from = "<up>",          to = ":res +5<CR>", },
    --	{ from = "<down>",        to = ":res -5<CR>", },
    --	{ from = "<left>",        to = ":vertical resize-5<CR>", },
    --	{ from = "<right>",       to = ":vertical resize+5<CR>", },
    --	-- { from = "sh",            to = "se", },
    --	-- { from = "sh",            to = "<C-w>t<C-w>K", },
    --	-- { from = "sv",            to = "<C-w>t<C-w>H", },
    --	{ from = "srh",           to = "<C-w>b<C-w>K", },
    --	{ from = "srv",           to = "<C-w>b<C-w>H", },
    --
    --	-- Tab management
    --	{ from = "tu",            to = ":tabe<CR>", },
    --	{ from = "tU",            to = ":tab split<CR>", },
    --	{ from = "tn",            to = ":-tabnext<CR>", },
    --	{ from = "ti",            to = ":+tabnext<CR>", },
    --	{ from = "tmn",           to = ":-tabmove<CR>", },
    --	{ from = "tmi",           to = ":+tabmove<CR>", },

    -- Other
    --	{ from = "<leader>sw",    to = ":set wrap<CR>" },
    --	{ from = "<leader>sc",    to = ":set spell!<CR>" },
    --	{ from = "<leader><CR>",  to = ":nohlsearch<CR>" },
    --	{ from = "<f10>",         to = ":TSHighlightCapturesUnderCursor<CR>" },
    --	{ from = "<leader>o",     to = "za" },
    --	{ from = "<leader>pr",    to = ":profile start profile.log<CR>:profile func *<CR>:profile file *<CR>" },
    --	{ from = "<leader>rc",    to = ":e ~/.config/nvim/init.lua<CR>" },
    --	{ from = "<leader>rv",    to = ":e .vim.lua<CR>" },
    --	{ from = ",v",            to = "v%" },
    --	{ from = "<leader><esc>", to = "<nop>" },
    --
    --	-- Joshuto
    { from = "R",          to = ":Joshuto<CR>" },
}




for _, mapping in ipairs(nmappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
--
--local function run_vim_shortcut(shortcut)
--	local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
--	vim.api.nvim_feedkeys(escaped_shortcut, 'n', true)
--end
--
---- close win below
--vim.keymap.set("n", "<leader>q", function()
--	vim.cmd("TroubleClose")
--	local wins = vim.api.nvim_tabpage_list_wins(0)
--	if #wins > 1 then
--		run_vim_shortcut([[<C-w>j:q<CR>]])
--	end
--end, { noremap = true, silent = true })


vim.cmd([[
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
]])
