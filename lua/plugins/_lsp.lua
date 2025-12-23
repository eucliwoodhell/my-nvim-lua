-- Mason
require('mason').setup({
    PATH = "prepend",
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup({
    automatic_installation = true,
    ensure_installed = {
        "ts_ls", "html", "cssls", "tailwindcss", "lua_ls", "graphql",
        "emmet_ls", "pyright", "eslint", "dockerls", "bashls", "sqlls",
        "rust_analyzer", "jsonls"
    }
})

require("mason-tool-installer").setup({
    ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", "eslint_d", "rustfmt"
    },
    auto_update = true,
    run_on_start = true
})

-- Capabilities para nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if ok_cmp then capabilities = cmp_lsp.default_capabilities(capabilities) end

capabilities.offsetEncoding = { 'utf-16' }

-- on_attach común
local on_attach = function(_, bufnr)
    local opts = {buffer = bufnr, silent = true}
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end

-- Lua LSP (nativo 0.11)
vim.lsp.config('lua_ls', {
    cmd = {'lua-language-server'},
    root_markers = {
        '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml',
        'stylua.toml', 'selene.toml', 'selene.yml', '.git'
    },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {globals = {"vim"}},
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            telemetry = {enable = false}
        }
    }
})

-- Rust LSP (nativo 0.11)
vim.lsp.config('rust_analyzer', {
    cmd = {'rust-analyzer'},
    root_markers = {'Cargo.toml', 'rust-project.json'},
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {
            cargo = {allFeatures = true},
            check = {command = "clippy"},
            diagnostics = {enable = true}
        }
    }
})

vim.lsp.config('ts_ls', {
    cmd = {'typescript-language-server', '--stdio'},
    root_markers = {'package.json', 'tsconfig.json', 'jsconfig.json', '.git'},
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true
            }
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true
            }
        }
    }
})

vim.lsp.config('emmet_ls', {
    cmd = {'emmet-ls', '--stdio'},
    filetypes = {
        "html", "css", "scss", "javascript", "javascriptreact", "typescript",
        "typescriptreact"
    },
    root_markers = {'.git/'},
    capabilities = capabilities,
    on_attach = on_attach
})

vim.lsp.config('tailwindcss', {
    cmd = {'tailwindcss-language-server', '--stdio'},
    filetypes = {
        "html", "css", "scss", "javascript", "javascriptreact", "typescript",
        "typescriptreact", "svelte", "vue"
    },
    root_markers = {
        'tailwind.config.js', 'tailwind.config.cjs', 'postcss.config.js',
        'postcss.config.cjs', 'package.json', 'node_modules/', '.git/'
    },
    capabilities = capabilities,
    on_attach = on_attach
})

vim.lsp.config('pyright', {
    cmd = {'pyright-langserver', '--stdio'},
    root_markers = {
        'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git/'
    },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autoImportCompletions = true,
                typeCheckingMode = "basic", -- Puede ser "off", "basic" o "strict"
                diagnosticMode = "workspace", -- Analiza todo el proyecto, no solo archivos abiertos
                useLibraryCodeForTypes = true,
                autoSearchPaths = true
            }
        }
    }
})

vim.lsp.config('sqlls', {
    cmd = {'sql-language-server', 'up', '--method', 'stdio'},
    filetypes = {'sql', 'mysql', 'plsql'},
    root_dir = require('lspconfig').util.root_pattern('.git', 'package.json',
                                                      'setup.py', 'setup.cfg',
                                                      'pyproject.toml',
                                                      'requirements.txt',
                                                      'Makefile',
                                                      'docker-compose.yml',
                                                      'docker-compose.yaml',
                                                      'dockerfile') or
        vim.loop.cwd(),
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        sqlLanguageServer = {
            connections = {},
            completion = {tableColumns = true, tableNames = true}
        }
    }
})

vim.lsp.config('jsonls', {
    cmd = {'vscode-json-language-server', '--stdio'},
    root_markers = {'.git/'},
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = {enable = true}
        }
    }
})

vim.lsp.config('dockerls', {
    cmd = {'docker-langserver', '--stdio'},
    root_markers = {'.git/'},
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        docker = {
            languageserver = {
                formatter = {
                    ignoreMultilineInstructions = true -- No formatea instrucciones multilínea
                },
                diagnostics = {
                    -- Nivel de severidad para diagnósticos
                    deprecatedMaintainer = "warning",
                    directiveCasing = "warning",
                    emptyContinuationLine = "warning",
                    instructionCasing = "warning", -- Advertencia si usas minúsculas en FROM, RUN, etc.
                    instructionCmdMultiple = "warning",
                    instructionEntrypointMultiple = "warning",
                    instructionHealthcheckMultiple = "warning",
                    instructionJSONInSingleQuotes = "warning",
                    instructionWorkdirRelative = "warning"
                }
            }
        }
    }
})

-- Habilitar los servidores
vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('ts_ls')
vim.lsp.enable('emmet_ls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('pyright')
vim.lsp.enable('sqlls')
vim.lsp.enable('jsonls')
vim.lsp.enable('dockerls')