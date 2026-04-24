local util = require("lspconfig.util")

-- rust_analyzer
vim.lsp.config.rust_analyzer = {
	filetypes = { "rust" },
	cmd = { "rust-analyzer" },
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			check = { command = "clippy" },
			diagnostics = { enable = true },
			disabled = { "too_many_arguments" },
		},
	},
}
vim.lsp.enable("rust_analyzer")

-- ts_ls
vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "typescriptreact" },
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
			},
		},
	},
}
vim.lsp.enable("ts_ls")

-- lua_ls
vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
			},
		},
	},
}
vim.lsp.enable("lua_ls")

vim.lsp.config.emmet_ls = {
	filetypes = {
		"html",
		"css",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"vue",
	},
	cmd = { "emmet-ls", "--stdio" },
}
vim.lsp.enable("emmet_ls")

vim.lsp.config.tailwindcss = {
	cmd = { "tailwindcss-language-server", "--stdio" },
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
				},
			},
		},
	},
}
vim.lsp.enable("tailwindcss")

vim.lsp.config.eslint = {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	root_dir = util.root_pattern("nx.json", ".eslintrc.json", ".eslintrc", "package.json", ".git"),
	settings = {
		workingDirectory = { mode = "location" }, -- en monorepos suele ir mejor que "auto"
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
}
vim.lsp.enable("eslint")

vim.lsp.config.jsonls = {
	cmd = { "vscode-json-language-server", "--stdio" },
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
}
vim.lsp.enable("jsonls")

vim.lsp.config.pyright = {
	name = "pyright",
	filetypes = { "python" },
	cmd = { "pyright-langserver", "--stdio" },
	settings = {
		pyright = {
			disableOrganizeImports = true,
			analysis = {
				autoImportCompletions = true,
				typeCheckingMode = "off", -- Puede ser "off", "basic" o "strict"
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,

				-- Desactiva los reportes molestos
				-- 🔥 DESACTIVA EXPLÍCITAMENTE
				reportOptionalMemberAccess = false,
				reportAttributeAccessIssue = false,
				reportGeneralTypeIssues = false,
				reportUnknownMemberType = false,
				reportUnknownVariableType = false,
				reportUnknownParameterType = false,
			},
		},
		python = {
			venvPath = "venv",
			analysis = {
				autoImportCompletions = true,
				typeCheckingMode = "off", -- Puede ser "off", "basic" o "strict"
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,

				-- Desactiva los reportes molestos
				-- 🔥 DESACTIVA EXPLÍCITAMENTE
				reportOptionalMemberAccess = false,
				reportAttributeAccessIssue = false,
				reportGeneralTypeIssues = false,
				reportUnknownMemberType = false,
				reportUnknownVariableType = false,
				reportUnknownParameterType = false,
			},
		},
	},
}
vim.lsp.enable("pyright")

vim.lsp.config.sqlls = {
	cmd = { "sql-language-server", "up", "--method", "stdio" },
	filetypes = { "sql", "mysql", "plsql" },
	root_dir = require("lspconfig").util.root_pattern(
		".git",
		"package.json",
		"setup.py",
		"setup.cfg",
		"pyproject.toml",
		"requirements.txt",
		"Makefile",
		"docker-compose.yml",
		"docker-compose.yaml",
		"dockerfile"
	) or vim.loop.cwd(),
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
				unusedSubquery = true,
			},
			-- puedes personalizar dialecto si tu versión del server lo soporta
			-- dialect = "mysql" | "postgresql" | "sqlserver" | "sqlite"
		},
	},
}
vim.lsp.enable("sqlls")

vim.lsp.config.dockerls = {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
	settings = {
		docker = {
			languageserver = {
				formatter = {
					ignoreMultilineInstructions = true, -- No formatea instrucciones multilínea
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
					instructionWorkdirRelative = "warning",
				},
			},
		},
	},
}
vim.lsp.enable("dockerls")

vim.lsp.config.gitlab_ci_ls = {
	cmd = { "gitlab-ci-ls", "--stdio" },
	filetypes = { "gitlab-ci.yml", "gitlab-ci.yaml" },
}
vim.lsp.enable("gitlab_ci_ls")

-- Bash
vim.lsp.config.bashls = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh", "zsh" },
	root_markers = { ".git", vim.uv.cwd() },
	settings = {
		bashIde = {
			globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
		},
	},
}
vim.lsp.enable("bashls")

vim.lsp.config.cssls = {
	cmd = { "css-languageserver", "--stdio" },
	filetypes = { "css", "scss", "less" },
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
}
vim.lsp.enable("cssls")

vim.lsp.config.shfmt = {
	cmd = { "shfmt", "-i", "2", "-ci" },
	filetypes = { "sh", "bash", "zsh" },
}

vim.lsp.enable("shfmt")

vim.lsp.config.gopls = {
	filetypes = { "go", "gomod", "gohtmltmpl", "gotexttmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
	cmd = {
		"gopls", -- share the gopls instance if there is one already
		"-remote=auto", --[[ debug options ]] --
		-- "-logfile=auto",
		-- "-debug=:0",
		"-remote.debug=:0",
		-- "-rpc.trace",
	},
	settings = {
		gopls = {
			-- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
			-- not supported
			analyses = { unusedparams = true, unreachable = false },
			codelenses = {
				generate = true, -- show the `go generate` lens.
				gc_details = true, --  // Show a code lens toggling the display of gc's choices.
				test = true,
				tidy = true,
			},
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			matcher = "fuzzy",
			diagnosticsDelay = "500ms",
			symbolMatcher = "fuzzy",
			gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
			buildFlags = { "-tags", "integration" },
			-- buildFlags = {"-tags", "functional"}
			semanticTokens = false,
		},
	},
}

vim.lsp.enable("gopls")
