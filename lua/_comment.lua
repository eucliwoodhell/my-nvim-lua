-- vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', {noremap = true})

vim.g.kommentary_create_default_mappings = false

vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default", {})


require('kommentary.config').configure_language("typescript", {
        single_line_comment_string  = '{/*", "*/}',
        multi_line_comment_strings = {"{/*", "*/}"},
        prefer_single_line_comments = true,
})
