--  :Mason - opens a graphical status window
--  :MasonUpdate - updates all managed registries
--  :MasonInstall <package> ... - installs/re-installs the provided packages
--  :MasonUninstall <package> ... - uninstalls the provided packages
--  :MasonUninstallAll - uninstalls all packages
--  :MasonLog - opens the mason.nvim log file in a new tab window

require("mason").setup({
  PATH = "prepend",
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  automatic_enable = false,
  automatic_installation = true,
  ensure_installed = {
    "jsonls",
    "cssls",
    "tailwindcss",
    "pylsp",
    "jedi_language_server",
    "rust_analyzer",
    "eslint",
    "dockerls",
    "bashls",
    "sqlls",
    -- "prettier"
  },
})

