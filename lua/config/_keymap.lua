-- vim.opt = read and write general option 
-- vim.o   = read and write option editor
-- vim.wo  = read and write value windows
-- vim.bo  = read and write file buffer
-- vim.g   = read and write value global {Option use}.
-- option
vim.g.mapleader = " "
vim.g.macvim_skip_colorscheme = 1

local editor_option = vim.o
-- local keymap         = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

local opt = {noremap = true, silent = true, expr = true}

editor_option.shortmess = editor_option.shortmess .. 'c'

local set_opts = function(opts)
    local noremap = opts.noremap == nil and true or opts.noremap
    local silent = opts.silent == nil and true or opts.silent
    local desc = opts.desc or nil
    return {noremap = noremap, silent = silent, desc = desc}
end

keymap('', '<Space>', '<Nop>', opt)

-- Actions keys
keymap("n", "<leader>w", function() vim.cmd("write") end,
       set_opts({desc = "Saves buffer"}))
keymap("n", "<leader>W", function() vim.cmd("w!") end,
       set_opts({desc = "Saves buffer!"}))
keymap("n", "<leader>q", function() vim.cmd("quit") end,
       set_opts({desc = "Quit buffer"}))
keymap("n", "<leader>wq", function() vim.cmd("DeleteCurrentBuffer") end,
       set_opts({desc = "Save and quit Buffer"}))
keymap("n", "<leader>F", function() vim.cmd("Format") end,
       set_opts({desc = "Format current buffer"}))
keymap("n", "<leader>m", function() vim.cmd("bnext") end,
       set_opts({desc = "Next buffer"}))
keymap("n", "<leader>z", function() vim.cmd("bprevious") end,
       set_opts({desc = "Previous buffer"}))
keymap("n", "<leader>q", function() vim.cmd("bdelete") end,
       set_opts({desc = "Close buffer"}))
keymap("n", "<leader>nm", function() vim.cmd("messages") end,
       set_opts({desc = "Messages"}))
keymap("n", "<leader>Q", function() vim.cmd("wq!") end,
       set_opts({desc = "Quit"}))
keymap("n", "<leader>pf",
       "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>",
       set_opts({desc = "Search"}))

-- move keys
keymap("", "Z", "^", set_opts({desc = "cursor right"}))
keymap("", "X", "$", set_opts({desc = "cursor left"}))

-- move line up and down
keymap("", "Ω", "<Esc>:m .-2<CR>===", {})
keymap("", "µ", "<Esc>:m .+1<CR>===", {})

-- windows managing
keymap("n", "<leader>WS", function() vim.cmd("split") end,
       set_opts({desc = "HSplit"}))
keymap("n", "<leader>WV", function() vim.cmd("vsplit") end,
       set_opts({desc = "VSplit"}))

-- resize windows
keymap("n", "<CR-S-Up>", function() vim.cmd("resize +2") end,
       set_opts({desc = "Increase windows height "}))
keymap("n", "<CR-S-Down>", function() vim.cmd("resize -2") end,
       set_opts({desc = "Decrease windows height"}))
keymap("n", "<CR-S-Left>", function() vim.cmd("vertical resize -2") end,
       set_opts({desc = "Decrease windows width"}))
keymap("n", "<CR-S-Right>", function() vim.cmd("vertical resize +2") end,
       set_opts({desc = "Increase windows width"}))

-- delete & cut
keymap("n", "x", [["_x]], set_opts({}))
keymap({"n", "v"}, "d", [["_d]], set_opts({}))
keymap("n", "F", [["_D]], set_opts({}))
keymap("n", "D", [["_d0]], set_opts({}))

-- search and replace
-- :cd to the directory of the current file
keymap("n", "<leader>r", [[:%s/\V<C-r>///g<left><left>]],
       {desc = "Search text and replace"})
keymap("v", "<leader>r", [[:'<,'>s/\V<C-r>///g<left><left>]],
       {desc = "Search text and replace"})
keymap("n", "<leader>g",
       [[:vimgrep /\V<C-r>//gj **/*<c-r>=setcmdpos(getcmdpos()-8)[1]<cr>]],
       {desc = "Search text and replace all files"})
-- :copen to open the quickfix window
keymap("n", "<leader>gr",
       [[:cfdo %s/\V<C-r>///gc | update<c-r>=setcmdpos(getcmdpos()-12)[1]<cr>]],
       {desc = "Open quickfix window and replace"})

keymap('n', '<leader>t', ':WhichKey<CR>', {})
keymap('n', '<leader>tf', ':WhichKey <leader><CR>', {})

--  left cursor position
--  <c-r>=setcmdpos(getcmdpos()-31)[1]<cr>
--  <left><left>
--  repeat('<left>', 31)
