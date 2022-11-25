local keymap = vim.api.nvim_set_keymap
local wk = require("which-key")

wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
  }
}

local mappings = {
  q = { ":q<cr>", "Quit" },
  Q = { ":wq<cr>", "Save & Quit" },
  w = { ":w<cr>", "Save" },
  x = { ":bdelete<cr>", "Close" },
}

keymap('n', '<leader>t', ':WhichKey<CR>', {})
keymap('n', '<leader>tf', ':WhichKey <leader><CR>', {})

wk.register(mappings, {prefix = "<leader>" })
