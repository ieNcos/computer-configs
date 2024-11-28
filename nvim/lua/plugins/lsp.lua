return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
            { -- nice loading notifications
                -- PERF: but can slow down startup
                'j-hui/fidget.nvim',
                enabled = false,
                opts = {},
            },
            {
                {
                    "folke/lazydev.nvim",
                    ft = "lua",
                    opts = {
                        library = {
                            { path = "luvit-meta/library", words = { "vim%.uv" } },
                        },
                    },
                },
                { "Bilal2453/luvit-meta", lazy = true },
                { -- optional completion source for require statements and module        annotations
                    'hrsh7th/nvim-cmp',
                    opts = function(_, opts)
                        opts.sources = opts.sources or {}
                        table.insert(opts.sources, {
                            name = 'lazydev',
                            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
                        })
                    end,
                },

            }


        },
        config = function ()
            local lspconfig = require 'lspconfig'
            local util = require 'lspconfig.util'

            require('mason').setup()
            require('mason-lspconfig').setup {
                --automatic_installation = true,
            }

            require('mason-tool-installer').setup {
                'tree-sitter-cli',
            }

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('ieNcos-lsp-attach',
                                                    {clear = true}),
                callback = function (event)
                    local function map(keys, func, desc)
                        vim.keymap.set('n', keys, func,
                            { buffer = event.buf, desc = 'LSP: '..'desc' })
                    end
                    local vmap = function(keys, func, desc)
                        vim.keymap.set('v', keys, func,
                            { buffer = event.buf, desc = 'LSP: '..'desc' })
                    end
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    assert(client, 'Lsp client not found')

                    ---@diagnostic disable-next-line: inject-field
                    client.server_capabilities.document_formatting = true

                    map('gS', vim.lsp.buf.document_symbol, '[g]o so [S]ymbols')

                end
            })
        end
    },
}
