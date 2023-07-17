-- install dependencies brew install ripgrep
local keymap = vim.api.nvim_set_keymap

require("telescope").setup({
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      previewer = false,
    }
  }
})


keymap('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
keymap('n', '<C-N>', ":Telescope file_browser<CR>", { noremap = true })
keymap('n', '<C-M>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
keymap('n', '<C-B>', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
