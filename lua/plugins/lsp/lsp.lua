return {
  "hrsh7th/nvim-cmp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },  -- fuente de snippets para cmp
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim",                  opts = {} },
  },
  config = function()
    local map = vim.keymap.set
    local create = vim.api.nvim_create_user_command

    -- CMP + LSP
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-f>"] = function()
          luasnip.jump(1)
        end,
        ["<C-b>"] = function()
          luasnip.jump(-1)
        end,

        -- opcional: moverte por el menú con C-j/C-k
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        -- añade otras fuentes si quieres (buffer, path, etc.)
        -- { name = "buffer" },
        -- { name = "path" },
      },
    })

    create("Format", ":lua vim.lsp.buf.format()", { nargs = 0 })
    create("FormatSync", ":lua vim.lsp.buf.format_sync()", { nargs = 0 })
    create("FormatSyncSeq", ":lua vim.lsp.buf.format_seq_sync()", { nargs = 0 })

    map('n', '<leader>a', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
    map('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
    map('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
    -- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
    map('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
    -- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
    -- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
    map('n', '<leader>f', ':Format<CR>', { noremap = true, silent = true })
  end,
}
