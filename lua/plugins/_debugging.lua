local dap = require('dap')

vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<Leader>dc', function() dap.set_breakpoint() end)


