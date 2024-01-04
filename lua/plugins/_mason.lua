--  :Mason - opens a graphical status window
--  :MasonUpdate - updates all managed registries
--  :MasonInstall <package> ... - installs/re-installs the provided packages
--  :MasonUninstall <package> ... - uninstalls the provided packages
--  :MasonUninstallAll - uninstalls all packages
--  :MasonLog - opens the mason.nvim log file in a new tab window

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- require("mason-lspconfig").setup({
--   automatic_installation = true,
--   ensure_installed = {
--     "jsonls",
--     "cssls",
--     "tailwindcss",
--     "pylsp",
--     "jedi_language_server",
--     "rust_analyzer",
--     "tsserver",
--     "eslint",
--     "dockerls",
--     "bashls",
--     "sqlls"
--   },
-- })

-- require("lspconfig").eslint.setup({
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "typescript",
--     "typescriptreact",
--     "rust"
--   },
--   tsserver = {
--     format = { enable = false }
--   },
--   eslint = {
--     enable = true,
--     format = { enable = true },
--     codeActionsOnSave = {
--       mode = "all",
--     }
--   }
-- })
