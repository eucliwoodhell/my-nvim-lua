-- lua/plugins/ui.lua
return {
    -- Theme
    {
        "jacoborus/tender.vim",
        lazy = false,
        priority = 1000,
        config = function() vim.cmd([[colorscheme tender]]) end
    }, -- Airline statusline
    {
        "vim-airline/vim-airline",
        lazy = false,
        dependencies = {"vim-airline/vim-airline-themes"},
        config = function()
            -- Configuración opcional de airline
            -- vim.g.airline_theme = 'tender' -- o el tema que prefieras
            -- vim.g.airline_powerline_fonts = 1
        end
    }, {"vim-airline/vim-airline-themes", lazy = true},

    -- Icons (aunque te recomiendo nvim-web-devicons en su lugar)
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = function()
            require("nvim-web-devicons").setup({default = true})
        end
    }, -- Cursorline
    {
        "yamatsum/nvim-cursorline",
        event = {"BufReadPost", "BufNewFile"},
        config = function()
            require("nvim-cursorline").setup({
                cursorline = {enable = true, timeout = 1000, number = false},
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = {underline = true}
                }
            })
        end
    }, -- Animate
    {"camspiers/animate.vim", lazy = false}, -- Lens (auto-resize windows)
    {
        "echasnovski/mini.icons",
        version = false,
        config = function()
        require("mini.icons").setup()
        end,
    }, -- Mini Statusline
}
