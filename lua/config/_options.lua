vim.cmd("syntax on")
local general_option = vim.opt

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
    ignorecase      = false,      -- ignore case in search patterns
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
    encoding        = "UTF-8",   -- enable codgin UTF-8
    fileencoding    = "UTF-8", 	 -- file metada
    tabstop         = 2,         -- insert 2 spaces for a tab
    softtabstop     = 2, -- Sets the number of column for a tab
    shiftwidth      = 2, -- Indents will have a width of 2
    termguicolors   = false,     -- set term gui colors (most terminals support this)
    timeoutlen      = 500,       -- timeout length
    undofile        = true,      -- enable persistent undo
    updatetime      = 300,       -- faster completion
    wrap            = true,      -- display lines as one long line
    -- writebackup  = false     -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
}

for k, v in pairs(options) do
  general_option[k] = v
end
