-- lua/plugins/toggleterm.lua
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm" },
    keys = {
      { "<F12>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    },
    config = function()
      -- Función global para keymaps en terminal
      function _G.set_terminal_keymaps()
        local opts = { noremap = true }
        local buf_map = vim.api.nvim_buf_set_keymap

        buf_map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
        buf_map(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
        buf_map(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
        buf_map(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
        buf_map(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
      end

      -- Autocmd para aplicar keymaps en terminales de toggleterm
      vim.cmd([[
        augroup ToggleTermKeymaps
          autocmd!
          autocmd TermOpen term://*toggleterm#* lua set_terminal_keymaps()
        augroup END
      ]])

      require("toggleterm").setup({
        -- size puede ser número o función
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.4)
          end
        end,
        open_mapping = [[<F12>]],
        on_open = function(_term) end,
        on_close = function(_term) end,
        highlights = {
          Normal = { link = "Normal" },
          NormalFloat = { link = "Normal" },
          FloatBorder = { link = "FloatBorder" },
        },
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = 1,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal", -- 'horizontal' | 'vertical' | 'window' | 'float'
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved", -- single/double/shadow/curved
          width = math.floor(0.7 * vim.fn.winwidth(0)),
          height = math.floor(0.8 * vim.fn.winheight(0)),
          winblend = 4,
        },
        winbar = { enabled = true },
      })
    end,
  },
}