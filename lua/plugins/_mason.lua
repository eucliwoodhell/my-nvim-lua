require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = {
      "jsonls",
      "cssls",
      "tailwindcss",
      "pylsp",
      "jedi_language_server",
      "rust_analyzer",
      "tsserver",
      "eslint",
      "dockerls",
      "bashls",
      "sqlls"
    },
})
