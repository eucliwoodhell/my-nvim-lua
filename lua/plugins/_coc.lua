local o = vim.o
local g = vim.g
local keymap = vim.api.nvim_set_keymap
local expr_opts = { noremap = true, silent = true, expr = true }
local opts = { noremap = true, silent = true }

o.hidden = true
o.backup = false
o.writebackup = false
o.updatetime = 300

-- extensions
g["coc_global_extensions"] = {
    "coc-css",
    "coc-json",
    "coc-cssmodules",
    "coc-eslint",
    "coc-prettier",
    "coc-lists",
    "coc-pyright",
    "coc-python",
    "coc-rls",
    "coc-rust-analyzer",
    "coc-tailwindcss",
    "coc-tsserver",
    "coc-lua",
    "coc-sumneko-lua"
}

-- use <c-space> to trigger completion.
keymap("i", "<c-space>", [[coc#refresh()]], expr_opts)

-- rename file use leader + rn
keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})

-- key mappings
-- toggle diagnostics
keymap("n", "<leader>ta", ":call CocAction('diagnosticToggle')<CR>", {})

-- use CR trigger autocomplete
keymap("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], expr_opts)

-- use tab and s-tab to move on snippet and autocomplete
g["coc_snippet_next"] = ""
g["coc_snippet_prev"] = ""
keymap(
    "i",
    "<tab>",
    [[coc#pum#visible() ? coc#pum#next(1) : coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetNext', [])<cr>" : "\<c-j>"]]
    ,
    expr_opts
)
keymap(
    "i",
    "<s-tab>",
    [[coc#pum#visible() ? coc#pum#prev(1) : coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetPrev', [])<cr>" : "\<c-k>"]]
    ,
    expr_opts
)

-- formatting selected code. Followed by highlighted code
keymap("x", "<leader>f", "<Plug>(coc-format-selected)", {})

-- mappings for CoCList
-- show all diagnostics (Errors and warnings).
keymap("n", "<space>a", ":<C-u>CocList diagnostics<CR>", opts)
-- find symbol of current document
keymap("n", "<leader>o", ":<C-u>CocList outline<CR>", opts)

-- use K to show documentation in preview window.
function Show_documentation()
    local filetype = vim.bo.filetype
    if filetype == "vim" or filetype == "help" then
        vim.api.nvim_command("h " .. vim.fn.expand("<cword>"))
    elseif vim.fn["coc#rpc#ready"]() then
        vim.fn.CocActionAsync("doHover")
    else
        vim.api.nvim_command(
            "!" .. vim.bo.keywordprg .. " " .. vim.fn.expand("<cword>")
        )
    end
end
keymap("n", "K", ":lua Show_documentation() <CR>", opts)


-- Commands
-- add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", ":CocCommand prettier.formatFile", { nargs = 0 })

-- add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OI", ":call CocActionAsync('runCommand', 'editor.action.organizeImport')",
    { nargs = 0 })

-- buffer sync
vim.api.nvim_exec([[ autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart ]], false)
vim.api.nvim_exec([[ autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear ]], false)
