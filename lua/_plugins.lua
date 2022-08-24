local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. "/plugin/packaer_compiled.lua"
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup({
        function (use)
                -- Packer can manage itself
                use 'wbthomason/packer.nvim'
                -- buffer bar head
                use 'ap/vim-buftabline'

                -- nerdtree
                use { 'preservim/nerdtree' }
                -- coc
                -- Plug 'neoclide/coc.nvim'
                use { 'neoclide/coc.nvim', branch = 'release' }
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
                use { 'nvim-telescope/telescope.nvim' }
                use { 'nvim-telescope/telescope-file-browser.nvim' }
                -- which key
                use { 'folke/which-key.nvim' }
                -- lspsaga
                use { 'tami5/lspsaga.nvim' }
                -- trouble
                use { 'kyazdani42/nvim-web-devicons' }
                use { 'folke/trouble.nvim' }
                -- decoration syntax
                use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
                -- theme
                use { 'jacoborus/tender.vim' }
                use { 'vim-airline/vim-airline' }
                use { 'vim-airline/vim-airline-themes' }
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

                if packer_bootstrap then
                        require('packer').sync()
                end
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
