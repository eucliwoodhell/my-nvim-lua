local g = vim.g
local keymap = vim.api.nvim_set_keymap

g.NERDTreeShowHidden = true
g.NERDTreeWinSize = 20
-- g.NERDTreeAutoDeleteBuffer = true

vim.api.nvim_exec([[ autocmd vimenter * NERDTree ]], false)
keymap('n', '<C-w>', ':NERDTree<CR>', {noremap = true})
keymap('n', '<C-a>', ':NERDTreeToggle<CR>', {noremap = true})
keymap('n', '<C-f>', ':NERDTreeFind<CR>', {noremap = true})
keymap('n', '<C-c>', ':NERDTreeClose<CR>', {noremap = true})
keymap('n', '<F5>', ':NERDTreeRefreshRoot<CR>', {noremap = true})
