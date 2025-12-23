require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
    "html",
    "css",
    "vue",
    "svelte",
    "rust",  -- ← agrega Rust
    "json",
    "markdown",
    "markdown_inline",
  },
  sync_install = false,
  auto_install = true,  -- instala parsers automáticamente si faltan
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },  -- el indent de treesitter ha mejorado, pruébalo
}