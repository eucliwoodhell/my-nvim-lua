local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require('lspsaga').setup {
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>"
  },
  code_action_keys = { quit = "q", exec = "<CR>" },
  rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. "
}

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>",
  { silent = true })


keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { silent = true })

if vim.fn.exists(":Telescope") then
  keymap('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', opts)
  keymap('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  keymap('n', '<leader>gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  keymap('n', '<leader>gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)
else
  keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
end

keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
