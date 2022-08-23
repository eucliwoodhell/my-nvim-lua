
local g = vim.g

g.NERDTreeShowHidden = true
g.NERDTreeWinSize = 30
g.NERDTreeAutoDeleteBuffer = true

vim.api.nvim_exec([[ autocmd vimenter * NERDTree ]], false)
vim.api.nvim_set_keymap('n', '<C-w>', ':NERDTree<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-a>', ':NERDTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-c>', ':NERDTreeClose<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F5>', ':NERDTreeRefreshRoot<CR>', {noremap = true})
