local keymap = vim.api.nvim_set_keymap
local wk = require("which-key")

wk.setup {
    plugins = {
        marks = false,
        register = false,
        spelling = {enabled = false, suggestions = 20}
    }
}

keymap("n", "<leader>t", ":WhichKey<CR>", {})
keymap("n", "<leader>tf", ":WhichKey <leader><CR>", {})
