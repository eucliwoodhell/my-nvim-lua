local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    'wbthomason/packer.nvim',
    -- buffer bar head
    'ap/vim-buftabline',
    -- nerdtree
    { 'preservim/nerdtree' },
    -- coc
    -- Plug 'neoclide/coc.nvim'
    -- {'neoclide/coc.nvim', branch = 'release'}
    -- {
    --   'VonHeikemen/lsp-zero.nvim',
    --   branch = 'v2.x',
    --   dependencies = {
    --     -- LSP Support
    --     { 'neovim/nvim-lspconfig' },             -- Required
    --     { 'williamboman/mason.nvim' },           -- Optional
    --     { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    --     -- Autocompletion
    --     { 'hrsh7th/nvim-cmp' },                  -- Required
    --     { 'hrsh7th/cmp-nvim-lsp' },              -- Required
    --     { 'L3MON4D3/LuaSnip' }                   -- Required
    --   }
    -- },
    { "williamboman/mason.nvim"},
    -- git diff
    { "sindrets/diffview.nvim" },
    { "mhinz/vim-signify" },
    -- Completion framework
    { 'hrsh7th/nvim-cmp' },
    -- SP completion source for nvim-cmp
    -- { 'hrsh7th/cmp-nvim-lsp' },
    -- Snippet completion source for nvim-cmp
    { 'hrsh7th/cmp-vsnip' },
    -- Other usefull completion sources
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    -- See hrsh7th's other plugins for more completion sources!
    -- To enable more of the features of rust-analyzer, such as inlay hints and more!
    { 'rust-lang-nursery/rustfmt' },
    -- Snippet engine
    { 'hrsh7th/vim-vsnip' },
    -- telescope
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim', version = '0.1.1' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    -- which key
    { 'folke/which-key.nvim' },
    -- lspsaga
    -- { 'tami5/lspsaga.nvim' },
    -- trouble
    { 
      'kyazdani42/nvim-web-devicons',
      lazy = false,
      priority = 1000 
    },
    {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      lazy = false,
      priority = 1000,
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to the default settings
          -- refer to the configuration section below
          icons = false
        }
      end
    },
    -- decoration syntax
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    -- theme 256 bit
    -- theme
    { 
      'rose-pine/neovim', 
      name = 'rose-pine' ,
      lazy = false,
      priority = 1000,
    },
    { "catppuccin/nvim", name = "catppuccin" },
    'navarasu/onedark.nvim',
    { 'projekt0n/github-nvim-theme', version = 'v0.0.7' },
    -- lualine
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
    },
    -- end
    -- theme 24 bit
    { 'jacoborus/tender.vim' },
    { 'vim-airline/vim-airline' },
    { 'vim-airline/vim-airline-themes' },
    -- end
    { 'ryanoasis/vim-devicons' },
    { 'yamatsum/nvim-cursorline' },
    { 'camspiers/animate.vim' },
    { 'camspiers/lens.vim' },
    -- comment
    -- Plug 'tpope/vim-commentary'
    { 'b3nj5m1n/kommentary' },
    -- css
    { 'ap/vim-css-color' },
    { 'jvanja/vim-bootstrap4-snippets' },
    -- multiple selectector visual
    { 'mg979/vim-visual-multi', branch = 'master' },
    -- codeium / alternative free copilot
    {
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
    },
    {
      'akinsho/bufferline.nvim',
      version = "*",
      dependencies = 'nvim-tree/nvim-web-devicons'
    },
    --  nvim-colorizer.lua
    'NvChad/nvim-colorizer.lua',
    {
      'mrshmllow/document-color.nvim',
      config = function()
        require("document-color").setup {
          -- Default options
          mode = "background" -- "background" | "foreground" | "single"
        }
      end
    },
    -- keyboard replace and update text
    {
      "kylechui/nvim-surround",
      version = "*", -- for stability; omit to `main` branch for the latest features
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to defaults
        })
      end
    },
    { "folke/zen-mode.nvim" },
    {
      "imNel/monorepo.nvim",
      config = function()
        require("monorepo").setup({
          -- config
          autoload_telescope = true
        })
      end,
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    },
}

require("lazy").setup(plugins, {})