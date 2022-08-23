-- vim.opt = read and write general option 
-- vim.o = read and write option editor
-- vim.wo = read and write value windows
-- vim.bo = read and write file buffer
-- vim.g = read and write value global {Option use}.
local general = vim.opt
local editor = vim.o

vim.cmd("syntax on")
vim.g.mapleader = " " 

editor.mouse             = "a"
editor.wrap              = false     -- do not wrap lines even if very long
editor.showcmd           = true      -- display command in bottom bar
editor.clipboard         = "unnamedplus"
editor.shortmess         = editor.shortmess .. 'c'
-- editor.backup            = true      -- use backup files
editor.showmode          = true 

general.title           = true      -- show title windows
general.cursorline      = true      -- highlight the current line
general.expandtab       = true      -- convert tabs to spaces
general.clipboard       = ""        -- copy and paster in diferent nvim	
general.cmdheight       = 1         -- more space in the neovim command line for displaying messages
general.colorcolumn     = "99999"   -- fixes indentline for now
-- general.hidden          = true      -- required to keep multiple buffers and open multiple buffers
general.hlsearch        = true      -- highlight all matches on previous search pattern
general.ignorecase      = true      -- ignore case in search patterns
general.list            = true
general.number 		    = true      -- set show number lines
general.numberwidth     = 1         -- set number column width to 2 {default 4}
general.pumheight       = 10        -- pop up menu height
general.signcolumn      = "yes"     -- always show the sign column otherwise it would shift the text each time
general.smartcase       = true      -- smart case
general.smartindent     = true      -- make indenting smarter again
general.spell           = false     -- disable spell checking
general.relativenumber  = false     -- set relative numbered line
general.fileformat      = "unix"  	-- format file
general.encoding        = "UTF-8"   -- enbla codgin UTF-8
general.fileencoding    = "UTF-8" 	-- file metada
--general.tabstop         = 2         -- insert 2 spaces for a tab
general.termguicolors   = false     -- set term gui colors (most terminals support this)
general.timeoutlen      = 500       -- timeout length
general.undofile        = true      -- enable persistent undo
general.updatetime      = 300       -- faster completion
general.wrap            = true      -- display lines as one long line
-- general.writebackup     = false     -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.g.macvim_skip_colorscheme = 1

-- keys
vim.api.nvim_set_keymap('n', '<F8>', ':tabp<CR>', {})
vim.api.nvim_set_keymap('n', '<F7>', ':tabn<CR>', {})
vim.api.nvim_set_keymap('n', '<F6>', ':tabnew<CR>', {})
vim.api.nvim_set_keymap('n', '<F4>', ':bdelete<CR>', {})
vim.api.nvim_set_keymap('n', '<F3>', ':bnext<CR>', {})
vim.api.nvim_set_keymap('n', '<F2>', ':bprevious<CR>', {})
