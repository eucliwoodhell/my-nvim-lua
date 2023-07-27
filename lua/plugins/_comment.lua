-- vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', {noremap = true})
local keymap = vim.api.nvim_set_keymap
vim.g.kommentary_create_default_mappings = false

keymap("n", "<leader>/", "<Plug>kommentary_line_default", {})
keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})

keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
keymap("x", "<leader>ci", "<Plug>kommentary_visual_increase", {})
keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
keymap("x", "<leader>cd", "<Plug>kommentary_visual_decrease", {})

require('kommentary.config').configure_language("typescript", {
    single_line_comment_string = '{/*", "*/}',
    multi_line_comment_strings = {"{/*", "*/}"},
    prefer_single_line_comments = true
})
