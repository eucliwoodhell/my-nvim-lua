return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            -- list of servers for mason to install
            ensure_installed = {
                "ts_ls", "html", "cssls", "tailwindcss", "lua_ls", "graphql",
                "emmet_ls", "pyright", "eslint", "dockerls", "bashls", "sqlls",
                "rust_analyzer", "jsonls"
            }
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗"
                        }
                    }
                }
            }, "neovim/nvim-lspconfig"
        },
        config = function(_, opts)
            require("mason-lspconfig").setup({
                ensure_installed = opts.ensure_installed,
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                    -- Rust
                    ["rust_analyzer"] = function()
                        require("lspconfig").rust_analyzer.setup({
                            settings = {
                                ['rust-analyzer'] = {
                                    cargo = {allFeatures = true},
                                    checkOnSave = {command = "clippy"},
                                    diagnostics = {enable = true}
                                }
                            }
                        })
                    end,
                    -- TypeScript/JavaScript
                    ["ts_ls"] = function()
                        require("lspconfig").ts_ls.setup({
                            settings = {
                                typescript = {
                                    inlayHints = {
                                        includeInlayParameterNameHints = "all",
                                        includeInlayFunctionParameterTypeHints = true
                                    }
                                }
                            }
                        })
                    end,

                    -- Lua
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {globals = {"vim"}},
                                    workspace = {
                                        library = vim.api.nvim_get_runtime_file(
                                            "", true),
                                        checkThirdParty = false
                                    },
                                    telemetry = {enable = false}
                                }
                            }
                        })
                    end,

                    -- Emmet
                    ["emmet_ls"] = function()
                        require("lspconfig").emmet_ls.setup({
                            filetypes = {
                                "html", "css", "scss", "javascript",
                                "javascriptreact", "typescript",
                                "typescriptreact"
                            }
                        })
                    end,

                    -- Tailwind
                    ["tailwindcss"] = function()
                        require("lspconfig").tailwindcss.setup({
                            settings = {
                                tailwindCSS = {
                                    experimental = {
                                        classRegex = {
                                            {
                                                "cva\\(([^)]*)\\)",
                                                "[\"'`]([^\"'`]*).*?[\"'`]"
                                            },
                                            {
                                                "cx\\(([^)]*)\\)",
                                                "(?:'|\"|`)([^']*)(?:'|\"|`)"
                                            }
                                        }
                                    }
                                }
                            }
                        })
                    end,

                    -- ESLint
                    ["eslint"] = function()
                        require("lspconfig").eslint.setup({
                            settings = {workingDirectory = {mode = "auto"}},
                            on_attach = function(client, bufnr)
                                vim.api.nvim_create_autocmd("BufWritePre", {
                                    buffer = bufnr,
                                    command = "EslintFixAll"
                                })
                            end
                        })
                    end,

                    -- JSON
                    ["jsonls"] = function()
                        require("lspconfig").jsonls.setup({
                            settings = {
                                json = {
                                    schemas = require("schemastore").json
                                        .schemas(),
                                    validate = {enable = true}
                                }
                            }
                        })
                    end,

                    -- Python
                    ["pyright"] = function()
                        require("lspconfig").pyright.setup({
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
                            },
                            -- Opcional: Para que reconozca mejor los entornos virtuales (venv)
                            on_init = function(client)
                                -- Si usas venv o .venv en la raíz del proyecto, esto ayuda a detectarlo
                                if client.config.settings then
                                    client.config.settings.python.pythonPath =
                                        vim.fn.exepath("python3")
                                end
                            end
                        })
                    end,

                    ["sqlls"] = function()
                        require("lspconfig").sqlls.setup({
                            cmd = {
                                "sql-language-server", "up", "--method", "stdio"
                            },
                            filetypes = {"sql", "mysql", "plsql"},
                            root_dir = require("lspconfig").util.root_pattern(
                                ".git", "package.json", "setup.py", "setup.cfg",
                                "pyproject.toml", "requirements.txt",
                                "Makefile", "docker-compose.yml",
                                "docker-compose.yaml", "dockerfile") or
                                vim.loop.cwd(),
                            settings = {
                                sqlLanguageServer = {
                                    lint = {
                                        -- activa/desactiva reglas de linting
                                        ambiguousColumn = true,
                                        ambiguousFunction = true,
                                        ambiguousGroupBy = true,
                                        caseSensitive = true,
                                        columnAlias = true,
                                        duplicateColumn = true,
                                        keyword = true,
                                        leadingWildcard = true,
                                        nullComparison = true,
                                        orderBy = true,
                                        secureFunction = true,
                                        union = true,
                                        unusedCte = true,
                                        unusedSubquery = true
                                    }
                                    -- puedes personalizar dialecto si tu versión del server lo soporta
                                    -- dialect = "mysql" | "postgresql" | "sqlserver" | "sqlite"
                                }
                            }
                        })
                    end,

                    ["dockerls"] = function()
                        require("lspconfig").dockerls.setup({
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
                    end
                }
            })
        end
    }, {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "pylint", "eslint_d", "rustfmt"
            }
        },
        dependencies = {"williamboman/mason.nvim"}
    }
}
