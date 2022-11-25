-- vim.opt = read and write general option 
-- vim.o   = read and write option editor
-- vim.wo  = read and write value windows
-- vim.bo  = read and write file buffer
-- vim.g   = read and write value global {Option use}.
local general_option = vim.opt
local editor_option  = vim.o
local keymap         = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true, expr = true}

vim.cmd("syntax on")

local options = {
    mouse           = "a",
    wrap            = false,     -- do not wrap lines even if very long
    showcmd         = true,      -- display command in bottom bar
    clipboard       = "unnamed,unnamedplus",
    -- backup       = true       -- use backup files
    showmode        = true, 
    title           = true,      -- show title windows
    cursorline      = true,      -- highlight the current line
    expandtab       = true,      -- convert tabs to spaces
    clipboard       = "",        -- copy and paster in diferent nvim	
    cmdheight       = 1,         -- more space in the neovim command line for displaying messages
    colorcolumn     = "99999",   -- fixes indentline for now
    -- hidden       = true       -- required to keep multiple buffers and open multiple buffers
    hlsearch        = true,      -- highlight all matches on previous search pattern
    ignorecase      = true,      -- ignore case in search patterns
    list            = true,
    number          = true,      -- set show number lines
    numberwidth     = 1,         -- set number column width to 2 {default 4}
    pumheight       = 10,        -- pop up menu height
    signcolumn      = "yes",     -- always show the sign column otherwise it would shift the text each time
    smartcase       = true,      -- smart case
    smartindent     = true,      -- make indenting smarter again
    spell           = false,     -- disable spell checking
    relativenumber  = false,     -- set relative numbered line
    fileformat      = "unix", 	 -- format file
    encoding        = "UTF-8",   -- enbla codgin UTF-8
    fileencoding    = "UTF-8", 	 -- file metada
    -- tabstop      = 2         -- insert 2 spaces for a tab
    termguicolors   = false,     -- set term gui colors (most terminals support this)
    timeoutlen      = 500,       -- timeout length
    undofile        = true,      -- enable persistent undo
    updatetime      = 300,       -- faster completion
    wrap            = true,      -- display lines as one long line
    -- writebackup  = false     -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
}

vim.g.mapleader = " "
vim.g.macvim_skip_colorscheme = 1
editor_option.shortmess       = editor_option.shortmess .. 'c'
keymap('', '<Space>', '<Nop>', opt)

-- keys map
-- keymap('n', '<F8>', ':tabp<CR>', {})
-- keymap('n', '<F7>', ':tabn<CR>', {})

keymap('n', '<leader>w', ':w!<CR>', {})
keymap('n', '<leader>d', ':bdelete<CR>', {})
keymap('n', '<leader>m', ':bnext<CR>', {})
keymap('n', '<leader>z', ':bprevious<CR>', {})

keymap('n', '<leader>wq', ':qw<CR>', {})
keymap('n', '<leader>q', ':quit<CR>', {})
keymap('n', '<leader>Q', ':q!<CR>', {})

keymap("n", "<leader>f", ':Format<CR>', {})
keymap('n', '<leader>t', ':WhichKey<CR>', {})
keymap('n', '<leader>tf', ':WhichKey <leader><CR>', {})

-- move at the start and end of line easily
keymap("", "Z", "^", {})
keymap("", "X", "$", {})

for k, v in pairs(options) do
  general_option[k] = v
end
