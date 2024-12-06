-- vim.opt = read and write general option
-- vim.opt = read and write general option
-- vim.o   = read and write option editor
-- vim.wo  = read and write value windows
-- vim.bo  = read and write file buffer
-- vim.g   = read and write value global {Option use}.
-- option
vim.g.mapleader = " "
vim.g.macvim_skip_colorscheme = 1

local editor_option = vim.o
local keymap = vim.keymap.set
local opt = { noremap = true, silent = true, expr = true }

editor_option.shortmess = editor_option.shortmess .. 'c'

local silent = { silent = true }
local set_opts = function(opts)
  local noremap = opts.noremap == nil and true or opts.noremap
  local silent = opts.silent == nil and true or opts.silent
  local desc = opts.desc or nil
  return { noremap = noremap, silent = silent, desc = desc }
end

keymap('', '<Space>', '<Nop>', opt)

keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)
keymap("n", "<leader>Q", ":q!<CR>", silent)
keymap("n", "<leader>F", ":Format<CR>", set_opts({ desc = "Format current buffer" }))
keymap("n", "<leader>m", ":bnext<CR>", silent)
keymap("n", "<leader>z", ":bprevious<CR>", silent)
keymap("n", "<leader>q", ":bdelete<CR>", silent)

keymap("n", "<leader>nm", ":messages<CR>", set_opts({ desc = "Messages" }))
keymap("n", "<leader>pf", "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>", set_opts({ desc = "Search" }))

-- move keys
keymap("", "Z", "^", silent)
keymap("", "X", "$", silent)

-- move line up and down
keymap("", "Ω", "<Esc>:m .-2<CR>===", {})
keymap("", "µ", "<Esc>:m .+1<CR>===", {})

-- windows managing
keymap("n", "<leader>WS", ":split<CR>", set_opts({ desc = "HSplit" }))
keymap("n", "<leader>WV", ":vsplit<CR>", set_opts({ desc = "VSplit" }))

-- resize windows
keymap("n", "<CR-S-Up>", ":resize +2<CR>", set_opts({ desc = "Increase windows height " }))
keymap("n", "<CR-S-Down>", ":resize -2<CR>", set_opts({ desc = "Decrease windows height" }))
keymap("n", "<CR-S-Left>", ":vertical resize -2<CR>", set_opts({ desc = "Decrease windows width" }))
keymap("n", "<CR-S-Right>", ":vertical resize +2<CR>", set_opts({ desc = "Increase windows width" }))

-- delete & cut
keymap("n", "x", [["_x]], silent)
keymap({ "n", "v" }, "d", [["_d]], silent)
keymap("n", "F", [["_D]], silent)
keymap("n", "D", [["_d0]], silent)

-- search and replace
-- :cd to the directory of the current file
keymap("n", "<leader>r", [[:%s/\V<C-r>///g<left><left>]], set_opts({ desc = "Search text and replace" }))
keymap("v", "<leader>r", [[:'<,'>s/\V<C-r>///g<left><left>]], set_opts({ desc = "Search text and replace" }))
keymap("n", "<leader>g", [[:vimgrep /\V<C-r>//gj **/*<c-r>=setcmdpos(getcmdpos()-8)[1]<cr>]], set_opts({ desc = "Search text and replace all files" }))

-- :copen to open the quickfix window
keymap("n", "<leader>rg", [[:cfdo %s/\V<C-r>///gc | update<c-r>=setcmdpos(getcmdpos()-12)[1]<cr>]], set_opts({ desc = "Open quickfix window and replace" }))
keymap('n', '<leader>t', ':WhichKey<CR>', silent)
keymap('n', '<leader>tf', ':WhichKey <leader><CR>', silent)
keymap('n', '<leader>ts', ':sort<CR>', silent)

-- git-messenger
keymap('n', '<leader>gm', ':GitMessenger<CR>', silent)

-- toggleterm
keymap('n', '<leader>at', ':ToggleTerm direction=float<CR>', set_opts({ desc = "Terminal float" }))
