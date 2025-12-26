return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {"<leader>xx", "<cmd>Trouble<cr>", desc = "Open Trouble"},
        {
            "<leader>aq",
            "<cmd>Trouble quickfix<cr>",
            desc = "Open Trouble QuickFix"
        },
        {
            "<leader>al",
            "<cmd>Trouble loclist<cr>",
            desc = "Open Trouble LocationList"
        },
        {
            "<leader>a",
            "<cmd>Trouble diagnostics<cr>",
            desc = "Open Trouble Document Diagnostics"
        },
        modes = {
            preview_float = {
                mode = "diagnostics",
                preview = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Preview",
                    title_pos = "center",
                    position = {0, -2},
                    size = {width = 0.3, height = 0.3},
                    zindex = 200
                }
            }
        }
    }
}
