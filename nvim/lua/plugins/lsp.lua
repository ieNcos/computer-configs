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

            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
            require('mason-lspconfig').setup {
                automatic_installation = false,
                ensure_installed = {
                    -- "lua_ls",
                    -- "rust_analyzer",
                },
            }

            require('mason-tool-installer').setup {
                'tree-sitter-cli',
            }

            lspconfig.tinymist.setup {
                -- offset_encoding = "utf-8",
            }
            lspconfig.clangd.setup {}
            lspconfig.pylsp.setup {}
            lspconfig.hls.setup {}
            lspconfig.clojure_lsp.setup {}
            lspconfig.rust_analyzer.setup({
            --    on_attach = on_attach,
                settings = {
                    ["rust-analyzer"] = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true
                        },
                    }
                }
            })

    vim.api.nvim_create_autocmd('FileType', {
      -- This handler will fire when the buffer's 'filetype' is "python"
      pattern = 'scheme',
      callback = function(ev)
        vim.lsp.start({
          name = 'steel-language-server',
          -- cmd = {'steel-language-server', '--option', 'arg1', 'arg2'},
          cmd = {'steel-language-server'},

          -- Set the "root directory" to the parent directory of the file in the
          -- current buffer (`ev.buf`) that contains either a "setup.py" or a
          -- "pyproject.toml" file. Files that share a root directory will reuse
          -- the connection to the same LSP server.
          root_dir = vim.fs.root(ev.buf, {}),
        })
      end,
    })
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
