-- vim.opt = read and write general option 
-- vim.o   = read and write option editor
-- vim.wo  = read and write value windows
-- vim.bo  = read and write file buffer
-- vim.g   = read and write value global {Option use}.
vim.g.mapleader = " "
vim.g.macvim_skip_colorscheme = 1

local editor_option  = vim.o
-- local keymap         = vim.api.nvim_set_keymap
local keymap         = vim.keymap.set

local opt = { noremap = true, silent = true, expr = true}

editor_option.shortmess = editor_option.shortmess .. 'c'

local set_opts = function (opts)
    local noremap = opts.noremap == nil and true or opts.noremap
    local silent = opts.silent == nil and true or opts.silent
    local desc = opts.desc or nil
    return {noremap= noremap, silent= silent, desc= desc}
end

keymap('', '<Space>', '<Nop>', opt)

-- Actions keys
keymap("n", "<leader>W", function() vim.cmd("write") end, set_opts({ desc = "Guardando buffer" }))
keymap("n", "<leader>Q", function() vim.cmd("quit") end, set_opts({ desc = "Saliendo del buffer" }))
keymap("n", "<leader>C", function() vim.cmd("DeleteCurrentBuffer") end, set_opts({ desc = "Guardnado y Cerrando Buffer" }))
keymap("n", "<leader>F", function() vim.cmd("Format") end, set_opts({ desc = "Organizando código" }))
keymap("n", "<leader>m", function() vim.cmd("bnext") end, set_opts({ desc = "Siguiente buffer" }))
keymap("n", "<leader>z", function() vim.cmd("bprevious") end, set_opts({ desc = "Anterior buffer" }))
keymap("n", "<leader>q", function() vim.cmd("bdelete") end, set_opts({ desc = "Cerrando buffer" }))
keymap("n", "<leader>nm", function () vim.cmd("messages") end, set_opts({ desc = "Mensajes"}))

-- move keys
keymap("", "Z", "^", set_opts({desc="cursor right"}))
keymap("", "X", "$", set_opts({desc="cursor left"}))

-- move line up and down
keymap("", "Ω", "<Esc>:m .-2<CR>===", {})
keymap("", "µ", "<Esc>:m .+1<CR>===", {})

-- windows managing
keymap("n", "<leader>WS", function() vim.cmd("split") end, set_opts({ desc = "HSplit" }))
keymap("n", "<leader>WV", function() vim.cmd("vsplit") end, set_opts({ desc = "VSplit" }))

-- resize windows
keymap("n", "<CR-S-Up>", function() vim.cmd("resize +2") end, set_opts({ desc = "Incrementa la altura de la ventana"}))
keymap("n", "<CR-S-Down>", function() vim.cmd("resize -2") end, set_opts({ desc = "Diminuye la altura de la ventana"}))
keymap("n", "<CR-S-Left>", function() vim.cmd("vertical resize -2") end, set_opts({ desc = "Diminuye el ancho de la ventana" }))
keymap("n", "<CR-S-Right>", function() vim.cmd("vertical resize +2") end, set_opts({ desc = "Incrementa el ancho de la ventana"}))

-- delete & cut
keymap("n", "x",[["_x]], set_opts({}))
keymap({"n", "v"}, "d", [["_d]], set_opts({}))
keymap("n", "F", [["_D]], set_opts({}))
keymap("n", "D", [["_d0]], set_opts({}))

-- search and replace
keymap("n", "<leader>r", [[:%s/\V<C-r>///g<left><left>]], { desc = "Buscar texto y reemplazar" })
keymap("v", "<leader>r", [[:'<,'>s/\V<C-r>///g<left><left>]], { desc = "Buscar texto y reemplazar" })

keymap('n', '<leader>t', ':WhichKey<CR>', {})
keymap('n', '<leader>tf', ':WhichKey <leader><CR>', {})

