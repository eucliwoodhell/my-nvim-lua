-- vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', {noremap = true})

local keymap = vim.api.nvim_set_keymap
vim.g.kommentary_create_default_mappings = false

keymap("n", "<leader>/", "<Plug>kommentary_line_default", {})
keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
keymap("x", "<leader>c", "<Plug>kommentary_visual_default", {})


require('kommentary.config').configure_language("typescript", {
        single_line_comment_string  = '{/*", "*/}',
        multi_line_comment_strings = {"{/*", "*/}"},
        prefer_single_line_comments = true,
})
