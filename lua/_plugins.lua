local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. "/plugin/packaer_compiled.lua"
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path
  })
end

return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'
    -- buffer bar head
    use 'ap/vim-buftabline'
    -- nerdtree
    use { 'preservim/nerdtree' }
    -- coc
    -- Plug 'neoclide/coc.nvim'
    -- use {'neoclide/coc.nvim', branch = 'release'}
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },                  -- Required
        { 'hrsh7th/cmp-nvim-lsp' },              -- Required
        { 'L3MON4D3/LuaSnip' }                   -- Required
      }
    }
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
    use { 'rust-lang-nursery/rustfmt' }
    -- Snippet engine
    use { 'hrsh7th/vim-vsnip' }
    -- telescope
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    -- which key
    use { 'folke/which-key.nvim' }
    -- lspsaga
    use { 'tami5/lspsaga.nvim' }
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
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
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
    use {
      'akinsho/bufferline.nvim',
      tag = "*",
      requires = 'nvim-tree/nvim-web-devicons'
    }
    --  nvim-colorizer.lua
    use 'NvChad/nvim-colorizer.lua'
    use {
      'mrshmllow/document-color.nvim',
      config = function()
        require("document-color").setup {
          -- Default options
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
    use ({
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    })
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
