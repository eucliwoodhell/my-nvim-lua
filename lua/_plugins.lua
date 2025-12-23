local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. "/plugin/packaer_compiled.lua"
local packer_bootstrap = nil
local todo_comments = require("plugins._todo_comments")

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path
  })
end

return require('packer').startup({
  function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'ap/vim-buftabline' }
    use { 'preservim/nerdtree' }
    -- LSP core
    use 'neovim/nvim-lspconfig'

    -- Mason (gestor de binarios / LSP / formatters / linters)
    use {
      'williamboman/mason.nvim',
      run = ':MasonUpdate' -- opcional pero recomendado
    }

    -- Integración Mason ↔ nvim-lspconfig
    use 'williamboman/mason-lspconfig.nvim'
    use 'WhoIsSethDaniel/mason-tool-installer.nvim'

    -- Autocompletado (opcional pero MUY recomendado)
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use "b0o/schemastore.nvim"

    -- git diff
    use { "sindrets/diffview.nvim" }
    use { "mhinz/vim-signify" }
    -- Completion framework
    use { 'hrsh7th/nvim-cmp' }
    -- SP completion source for nvim-cmp
    use { 'hrsh7th/cmp-nvim-lsp' }
    -- Snippet completion source for nvim-cmp
    use { 'hrsh7th/cmp-vsnip' }
    -- Other usefull completion sources
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-buffer' }
    -- See hrsh7th's other plugins for more completion sources!
    -- To enable more of the features of rust-analyzer, such as inlay hints and more!
    -- Snippet engine
    use { 'hrsh7th/vim-vsnip' }
    -- telescope
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim', branch = 'master' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    -- which key
    use { 'folke/which-key.nvim' }
    -- -- lspsaga
    -- use { 'tami5/lspsaga.nvim' }
    -- trouble
    use { 'kyazdani42/nvim-web-devicons' }
    use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          icons = false
        }
      end
    }
    -- decoration syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- theme 256 bit
    -- theme
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'navarasu/onedark.nvim'
    use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
    -- lualine
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    -- end
    -- theme 24 bit
    use { 'jacoborus/tender.vim' }
    use { 'vim-airline/vim-airline' }
    use { 'vim-airline/vim-airline-themes' }
    -- end
    use { 'ryanoasis/vim-devicons' }
    use { 'yamatsum/nvim-cursorline' }
    use { 'camspiers/animate.vim' }
    use { 'camspiers/lens.vim' }
    -- comment
    -- Plug 'tpope/vim-commentary'
    use { 'b3nj5m1n/kommentary' }
    -- css
    use { 'ap/vim-css-color' }
    use { 'jvanja/vim-bootstrap4-snippets' }
    -- multiple selectector visual
    use { 'mg979/vim-visual-multi', branch = 'master' }
    -- codeium / alternative free copilot
    use {
      'Exafunction/codeium.vim',
      config = function()
        vim.keymap.set('i', '<C-g>', function()
          return vim.fn['codeium#Accept']()
        end, { expr = true })
        vim.keymap.set('i', '<c-x>',
          function()
            return vim.fn['codeium#Clear']()
          end, { expr = true })
      end
    }
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    --  nvim-colorizer.lua
    use 'NvChad/nvim-colorizer.lua'
    use { 'mrshmllow/document-color.nvim', config = function()
      require("document-color").setup {
        mode = "background" -- "background" | "foreground" | "single"
      }
    end
    }
    -- keyboard replace and update text
    use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    })
    use { "folke/zen-mode.nvim" }
    use({ "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end })
    use { "akinsho/toggleterm.nvim", tag = '*' }
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", opt = todo_comments }
    use { "rhysd/git-messenger.vim" }
    use {
      'derektata/lorem.nvim',
      config = function()
        require('lorem').opts {
          sentence_length = "mixed",
          comma_chance = 0.2,
          max_commas = 2,
        }
      end
    }
    use {
      "https://gitlab.com/itaranto/plantuml.nvim",
      tag = "*",
      config = function()
        require("plantuml").setup()
      end
    }
    use {
      "lewis6991/gitsigns.nvim",
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup {
          -- Opciones básicas
          signs      = {
            add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            topdelete    = { hl = 'GitSignsDelete', text = ' ̅', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          },
          linehl     = false,
          signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
          numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
          word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        }
      end
    }
    use {
      "3rd/image.nvim",
      config = function()
        require("image").setup({})
      end,
    }
    use {
      "3rd/diagram.nvim",
      requires = {
        "3rd/image.nvim",
      },
      config = function()
        require("diagram").setup({
          -- Aquí puedes poner tu configuración personalizada
          -- o dejarlo vacío para usar los valores por defecto
        })
      end,
    }
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- Adaptadores
        "nvim-neotest/neotest-python", -- Python
        "rouge8/neotest-rust",     -- Rust
        "nvim-neotest/neotest-jest", -- Jest (TS/JS)
        "marilari88/neotest-vitest", -- Vitest (TS/JS)
      }
    }
    --[[ use {
      'mfussenegger/nvim-dap',
      dependencies = {
        'rcarriga/nvim-dap-ui',
      }
    } ]]
    if packer_bootstrap then require('packer').sync() end
  end,
  config = {
    compile_path = compile_path,
    disable_commands = true,
    max_jobs = 50,
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})
